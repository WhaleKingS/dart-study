// 비동기 함수인 sayHello 를 생성한 후
// 해당 함수가 실행된지 5초 후에 Hello 라는 내용의 문자열을 출력하는 코드를 작성해보세요.
// 해당 함수가 종료된 후, main 함수에서는 [Hello가 출력되었습니다.]라는 문자열이
// 출력되어야 합니다.

Future<String> sayHello() async {
  return await Future.delayed(Duration(seconds: 5), () => "hello");
}

void main() async {
  var test = await sayHello();
  print(test);
  print("Hello가 출력되었습니다.");
}
