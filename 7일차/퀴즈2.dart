// localhost:8080 으로 접근할 수 있는 서버를 생성하고,
// 크롬 검색창에서 localhost:8080/capital=Korea 과 같이 입력했을 때,
// 다음과 같이 출력이 되는 기능을 만드세요.
// [Korea의 수도는 Seoul 입니다.]
// 단, 수도가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
// [유효하지 않은 수도를 입력하셨습니다.]
import 'dart:convert';
import 'dart:io';

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
  print('Request from $ip:$port - Method: $method, Path: $path');
}

Future main() async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };
  //서버를 생성, 실행시키는 방법: HttpServer.bind(사용할IP주소,포트번호)
  //HttpServer.bind(사용할IP주소,포트번호) 이거는 비동기 함수이다.
  //그래서 server 변수에 값이 들어가기 전에 밑에 있는 print....가 실행이 된다.
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  printHttpServerActivated(server);

  // 사용자에게 받은 요청을 처리하는 부분
  // 서버는 사용자로부터 요청(request)가 있어야, 응답(response)을 줄 수 있음
  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);

    //.uri: 사용자가 보낸 요청에 대한 주소. 주소는 서버의 주소
    //.path: 주소에 대한 경로. 경로는 사용자가 요청한 주소에서 서버의
    //        ip주소와 포트번호를 제외한 나머지 문자열. 즉 /
    if (request.uri.path == "/") {
      // 주소창에 ....8080 만 넣었는데 /을 넣은 if문이 동작한 이유
      // 기본적으로 우리가 /을 작성하지 않더라고 컴퓨터가 자동으로 /을 넣어줌
      // print("사용자가 요청을 보냄");

      // 사용자가 요청이 /country로 보낸 것인지 확인
      // request.uri.path 즉 사용자가 요청한 경로에 /country라는 문자열이 있는지 확인
    } else if (request.uri.path.contains("/country")) {
      var name = request.uri.path.split("=");
      var input = name[1];
      print(name[1]); // = /country=korea 에서 korea만 나옴

      if (country.containsKey(input)) {
        var sudo = country[input];
        var result = utf8.encode("$input의 수도는 $sudo 입니다.");

        //사용자 요청에 대한 실제 응답 전달 부분 구현
        //request.response =  사용자 요청에 대한 응답
        //statusCode =  이 응답에 대한 상태
        //headers.contentType =  응답에서 사용자에게 전해줄 데이터의 타입
        //headers.contentLength =  응답에서 사용자에게 전해줄 데이터 길이
        //write :  앞서 작성한 내용대로 사용자에게 응답을 보내겠다.
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
          ..headers.contentLength = result.length
          ..add(result);
      } else {
        var result = utf8.encode("유효하지 않은 수도를 입력하셨습니다");
      }
    }
  }
  // 항상 사용자의 요청에 대한 응답을 write 하고 난 뒤에는
  //이 응답은 이렇게 끝내겠다 라고 하는 "response 닫는 기능"을 작성해야함
  //await request.response.close();
}
