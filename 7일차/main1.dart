import 'dart:io';
import 'dart:async';
import 'dart:math';

Future<int> async1() async {
  print("[4] async1(): 1 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async1(): finished.");
  return 10;
}

Future<int> async2() async {
  print("[4] async2(): 2 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async2(): 1 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async2(): finished.");
  return 20;
}

Future<int> async3() async {
  print("[4] async3(): 3 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async3(): 2 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async3(): 1 second left.");
  await Future.delayed(Duration(seconds: 1));
  print("[4] async3(): finished.");
  return 30;
}

void main() {
  // 내용을 출력할 때 사용 했던 기능들
  //print()
  //stdout.write()

  // List<String> fruits = ['Apple is Red', ' Banana  ', 'Mango'];
  // print("[1] Mango in List? : ${fruits.contains('Mango')}");
  // print("[1] Starts with 'Apple'? : ${fruits[0].startsWith('Apple')}");
  // print("[1] Ends with 'Red' : ${fruits[0].endsWith('Red')}");
  // print("[1] Index of 'Red' : ${fruits[0].indexOf('Red')}");
  // print("[1] Trim '  Banana  '? : ${fruits[1].trim()}");

  // //platform - dart :io 라이버리에서 제공해주는 기능
  // //Native 환경  -> 윈도우 os 맥os

  // String os = Platform.operatingSystem;
  // String path = Platform.script.toFilePath();

  // print("[2] OS:$os");
  // print("[2] Source File: $path");

  // // dart:math - 샆칙연산 등 기본적인 계산을 지원
  // //

  // print("[3] max(2,4): ${max(2, 4)}");
  // print("[3] min(2,4): ${min(2, 4)}");
  // print("[3] e: {$e}");
  // print("[3] pi: {$pi}");

  var t1 = DateTime.now();
  Future.wait([async1(), async2(), async3()])
      .then((List<int> nums) {
        var t2 = DateTime.now();
        var sum = nums.reduce((curr, next) => curr + next);
        print('[4] Sum: $sum < Time: ${t2.difference(t1)} >');
      })
      .catchError(print);
}
