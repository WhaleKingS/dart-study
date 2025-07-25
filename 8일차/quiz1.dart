// 기존에 학습했던 http 코드들을 참고하여 사용자를 CRUD 할 수 있는 RESTful 프로그램을 작성하고자 합니다.
// 다음의 코드들을 참고하여 RESTful 프로그램을 완성하세요.
// 서버의 포트는 3000번 포트를 이용하며,
// 각 API들은 /user 를 이용하여 호출이 되어야 합니다.

import 'dart:convert';
import 'dart:io';

void create(Map database, HttpRequest request) async {
  // 생성 코드 작성
  var bodydata = await utf8.decoder.bind(request).join();
  var mapData = jsonDecode(bodydata) as Map;
  var key, value;

  //map에서 key0001과 value 권태윤을 추출해보자
  mapData.forEach((k, v) {
    key = k;
    value = v;
  });

  if (database.containsKey(key) == false) {
    database[key] = value;
    bodydata = "Success < $mapData created >";
  } else {
    bodydata = "Fail < $key already exist >";
  }

  printAndSendHttpResponse(database, request, bodydata);
}

void read(Map database, HttpRequest request) async {
  // 조회 코드 작성
  var key = request.uri.pathSegments.last;
  var content, transaction;
  if (database.containsKey(key) == true) {
    transaction = {};
    transaction[key] = database[key];
    content = "Success < $transaction retrieved >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

void update(Map database, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (database.containsKey(key) == true) {
    database[key] = value;
    content = "요청 성공 < $transaction updated >";
  } else {
    content = "요청 실패 < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

void delete(Map database, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content, value;

  if (database.containsKey(key) == true) {
    value = database[key];
    database.remove(key);
    content = "요청 성공 < {$key, $value} deleted >";
  } else {
    content = "요청 실패 < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

Future main() async {
  var database = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('user') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          case 'POST':
            create(database, request);
            break;
          case 'GET':
            read(database, request);
            break;
          case 'PUT':
            update(database, request);
            break;
          case 'DELETE':
            delete(database, request);
            break;

          default:
            print("\$ 지원하지 않는 메서드입니다.");
            break;
        }
      } catch (err) {
        print("\$ 요청 수행 중 에러가 발생했습니다.");
      }
    } else {
      printAndSendHttpResponse(
        database,
        request,
        "${request.method} {에러: 지원하지 않는 API 입니다.}",
      );
    }
  }
}

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

void printAndSendHttpResponse(
  Map database,
  HttpRequest request,
  String content,
) async {
  print("\$ $content \n current DB      : $database");

  var data = utf8.encode(content);

  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = data.length
    ..statusCode = HttpStatus.ok
    ..add(data);

  await request.response.close();
}
