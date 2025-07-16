// 현재 rest-crud.dart 에 있는 파일에서 updateDB 부분은 수정할 데이터가 들어가 있는 값을
// 전부 body에 담아서 사용을 하고 있습니다.
// 이 부분을 저희는 수정할 데이터의 key 값을 요청의 마지막 부분에 담아서 수정을 하고 싶습니다.
// ex) PUT 127.0.0.1:4040/api/0001
// 이 방식을 이용해서 key 값을 조회하고, body 부분에는 다음과 같이 입력을 했을 때
// key에 있는 데이터가 수정이 될 수 있게 하고자 합니다.
// body에 들어갈 값 : { "data": "Cheongju" }
// 현재 존재하는 updateDB 를 위에 작성한 내용대로 실행했을 때 값이 수정되도록 변경해보세요.

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
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });
  if (db.containsKey(key) == false) {
    db[key] = value;
    content = "Success < $transaction created >";
  } else {
    content = "Fail < $key already exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void readDB(Map db, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content, transaction;

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
  print("이거임 $transaction");

  transaction.forEach((k, v) {
    print("입력 $k");
    print("출력 $v");
    key = request.uri.pathSegments.last;
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
  var db = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('/api') == true) {
      printHttpRequestInfo(request);
      try {
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
