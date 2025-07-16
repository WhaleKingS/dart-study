// REST 라는 HTTP 통신을 어덯게 사용할지에 대한 규약에 대해서 학습
// REST 에서 기본적으로 사용되는 메서드들 - post get put delete가 있다
// 이 메서드들을 사용 할때 생성(create)를 사용
// REST 에서는 기본적으로 CRUD를 구현하게 되는데, CRUD는 다음과 같은 기능을 한다.
// CREATE -post
// READ -get
// UPDATE -put
// DELETE -delete
// REST 방식으로 개발을 진행하면 RESTful 하다. 라고 부른다.
// 기본적으로 REST를 이용한 api 를 구현할 때에는 다음의 구조를 따라서 만들게 된다.
// ip:port/{기능이름}/{KEY값}
// 예를 들어서 사용자 생성 이라는 기능을 만들어야 한다면
// 12.0.0.1:4040/user로 POST 매서드를 이용하면 된다
// 수정기능이면
// 12.0.0.1:4040/user/{키값} 으로 put 매서드를 이용하면 된다.

import 'dart:io';
import 'dart:convert';

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print('\$ $method $path from $ip:$port');

  if (request.headers.contentLength != -1) {
    print('\> content-type: ${request.headers.contentType}');
    print('\> content-lendth: ${request.headers.contentLength}');
  }
}

//db: Rest 방식을 이용해서 사용자가 요청을 보낼 때 CRUD가 진행된 후 결과를 담을 변수
// request: 사용자의 요청
// content: 사용자의 요청에 대한 응답으로 전달해줄 값
void printAndSendHttpResponse(var db, var request, var content) async {
  print("\$ $content \n current DB     : $db");
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void createDB(var db, var request) async {
  // content 변수에 사용자의 요청을 utf8 코드로 해독해서 담고 있다.
  var content = await utf8.decoder.bind(request).join();
  // transavtion 변수에 utf8 코드로 해독한 사용자의 요청을 담고 있다
  // 근데 담을 때 as Map을 통해서 JSON  형식의 데이터를 Map 형식으로 변형해서 담고 있구나
  var transaction = jsonDecode(content) as Map;
  var key, value; // DB에 정보를 담을 때 각 정보의 key와 value에 담을 때 사용할 변수

  print("\> content        : $content");

  // Map변수.forEach: Map변수 안에 있는 각각의 값들을 전부 다 하나씩 접근하겠다.
  // (k,v): transaction Map 변수에서 가지고 있는 key와 value를 k 와 v로 표현
  transaction.forEach((k, v) {
    //우리가 가지고 있는 transaction의 key(k)를 바깥에서 선언한 key 변수에 담겠다.
    key = k;
    //우리가 가지고 있는 transaction의 value(v)를 바깥에서 선언한 value 변수에 담겠다.
    value = v;
  });

  //db 변수가 key를 현재 가지고 있지 않느냐?
  if (db.containsKey(key) == false) {
    // 현재 db에 값이 없으면 해당 key에 해당하는 부분에 value를 넣어라
    db[key] = value;
    content = "Success < $transaction created >";
  } else {
    content = "Fail < $key already exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

// request라는 변수에 타입을 지정해주지 않고 var 라고 지정을 했기 때문에
// 컴퓨터에서는 request가 어느 타입인지 모르게 된다. -> 임시로 dynamic으로 임의로 지정시켜버림
// dynamic은 모든 타입들을 담을 수 있어서 컴퓨터가 자동완성을 지원하지 않음.
void readDB(Map db, HttpRequest request) async {
  //request.uri: 요청한 주소
  //pathSegments: 요청한 주소에 작성이 되어있는 "/"를 의미
  //              /로 이후 값들을 분리해서 저장함.
  //              ex) 127.0.0.1:4040/api/001
  //                 ["api", "001"] 이렇게 / 마다 분리를 해준다.
  //.last: 마지막 데이터
  var key = request.uri.pathSegments.last;
  var content, transaction;

  // db 변수가 key를 현재 가지고 있느냐?
  if (db.containsKey(key) == true) {
    transaction = {};
    transaction[key] = db[key];
    content = "Success < $transaction retrieved >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void upateDB(Map db, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (db.containsKey(key) == true) {
    db[key] = value;
    content = "Success < $transaction updated >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void deleteDB(Map db, HttpRequest request) async {
  var key = request.uri.pathSegments.last; // 삭제할 데이터 키를 /이후의 문자열로 받고 있다
  var content, value;

  if (db.containsKey(key) == true) {
    value = db[key];
    db.remove(key);
    content = "Success < {$key, $value} deleted >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

Future main() async {
  // key에 dynamic, value에 dynamic 타입을 가진 Map변수 선언
  var db = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);

  printHttpServerActivated(server);

  //앞으로 서버에 요청을 보낼때 우리는 주소/api/~~ 이 경로로 요청을 보내면 된다.
  await for (HttpRequest request in server) {
    //request.uri.path.contains(사용자가 요청한 주소의 경로)가 /api라는 값을 포함하냐?
    if (request.uri.path.contains('/api') == true) {
      printHttpRequestInfo(request);
      try {
        //request.method (사용자가 생성한 요청의 매서드)에 따라
        //post, get, put, delete 가 실행됐을 때 각자 다른 함수를 실행하겠다.
        //default 를 이용해서 다른 매서드를 사용하면 아무런 기능을 하지 않게 지정하겠다.
        switch (request.method) {
          case 'POST':
            createDB(db, request);
            break;
          case 'GET':
            readDB(db, request);
            break;
          case 'PUT':
            upateDB(db, request);
            break;
          case 'DELETE':
            deleteDB(db, request);
            break;
          default:
            print("\$ Unsupported http method");
        }
      } catch (err) {
        print("\$ Exception in http request processing");
      }
    } else {
      printAndSendHttpResponse(
        db,
        request,
        "${request.method} {ERROR: Unsupported API}",
      );
    }
  }
}
