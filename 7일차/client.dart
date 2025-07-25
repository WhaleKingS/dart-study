import 'dart:io';
import 'dart:convert';

Future main() async {
  var serverIp = InternetAddress.loopbackIPv4.host;
  var serverPort = 3000;
  var serverPath;

  var httpClient = HttpClient();
  var httpResponseContent;
  var httpContent;

  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|-> [step.1] GET /");
  serverPath = "";
  // serverIp, severPort, severPath 등의 서버 접속 정보를 이용해서
  // get TRequest를 전송하겠다.
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);

  //보낸 request를 close() 해줘야 해당 request에 대한 response를 가져올 수 있다.
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

  print("|-> [step.2] GET /add,3,6");
  serverPath = "/add,3,6";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

  print("|-> [step.3] GET /sample.txt");
  serverPath = "/sample.txt";
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

  print("|-> [step.4] POST item=product#1234");
  httpContent = "item=product#1234";
  serverPath = "/";
  httpRequest = await httpClient.post(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = httpContent.length
    ..write(httpContent);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

  print("|-> [step.5] PUT /timestamp.txt");
  httpContent = "created at ${DateTime.now()}.";
  serverPath = "/timestamp.txt";
  httpRequest = await httpClient.put(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
    ..headers.contentLength = httpContent.length
    ..write(httpContent);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);

  print("|-> [step.6] DELETE /timestamp.txt");
  serverPath = "/timestamp.txt";
  httpRequest = await httpClient.delete(serverIp, serverPort, serverPath);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);
}

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
