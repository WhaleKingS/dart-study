import 'dart:io';

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;

  var server = await HttpServer.bind(ip, port);

  print('\$ server activated - ${server.address.address}:${server.port}.');

  await for (HttpRequest request in server) {
    try {
      if (request.uri.path.contains('/dan')) {
        //request 에 따른 기능 구현
        var varList = request.uri.path.split(',');
        var dan = int.parse(varList[1]);

        //1~9 까지 전부 곱하기 기능을 write 해야한다.
        // for(var i = 1; i <= 9 ; i ++){
        //   result
        // }
        //응답 작성
        request.response.statusCode = HttpStatus.ok;
        request.response.write("""
$dan X 1 = ${dan * 1}
$dan X 2 = ${dan * 2}
$dan X 3 = ${dan * 3}
$dan X 4 = ${dan * 4}
$dan X 5 = ${dan * 5}
$dan X 6 = ${dan * 6}
$dan X 7 = ${dan * 7}
$dan X 8 = ${dan * 8}
$dan X 9 = ${dan * 9}
""");
      }

      //우리는 사용자가 요청한 내용에 대한 응답을 다 했으니, 이 연결을 종료할게.
      await request.response.close();
    } catch (error) {
      print(error);
      print("에러 발생!");
    }
  }
}
