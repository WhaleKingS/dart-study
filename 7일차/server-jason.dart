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

void httpGetHandler(HttpRequest request) async {
  if (request.uri.path == '/') {
    var content = "Hello, World!";
    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (request.uri.path.contains('/add')) {
    var vars = request.uri.path.split(',');
    var result = int.parse(vars[1]) + int.parse(vars[2]);
    var content = "${vars[1]} + ${vars[2]} = $result";

    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else if (await File(request.uri.path.substring(1)).exists() == true) {
    var file = File(request.uri.path.substring(1));
    var content = await file.readAsString();

    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.ok
      ..write(content);
  } else {
    var content = 'Unsupported URI';

    request.response
      ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
      ..headers.contentLength = content.length
      ..statusCode = HttpStatus.notFound
      ..write(content);
  }

  await request.response.close();
}

void httpPutHanlder(var addr, var port, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var file = await File(request.uri.path.substring(1)).openWrite();
  print("\> content         : ${content}");
  file
    ..write(content)
    ..close();
  content = 'http://$addr:$port${request.uri.path} created';
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

void httpPostHandler(HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var product = content.split("=");
  print("\> content        : ${content}");
  content = "Product '${product[1]}' accepted";
  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);
  await request.response.close();
}

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4, // ip address
    3001, // port number
  );
  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);
    try {
      // start-of-modification
      var content = await utf8.decoder.bind(request).join();
      var jsonData = jsonDecode(content) as Map;
      print("\> content        : $jsonData");
      print("\$ jsonData['Korea'] is ${jsonData['Korea']}");
      print("\$ jsonData['Japan'] is ${jsonData['Japan']}");
      print("\$ jsonData['China'] is ${jsonData['China']}");
      content = "POST JSON accepted";
      request.response
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.ok
        ..write(content);
      await request.response.close();
    } catch (err) {
      print("\$ 예상치 못한 에러가 발생했다.");
    }
  }
}
