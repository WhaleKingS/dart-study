import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() {
  // 내용을 출력할 때 사용 했던 기능들
  //print()
  //stdout.write()

  List<String> fruits = ["'Apple is Red', '  Banana  ' ,'Mango'"];
  print("[1] Mango in List? : ${fruits.contains('Mango')}");
  print("[1] Starts with 'Apple'? : ${fruits[0].startsWith('Apple')}");
  print("[1] Ends with 'Red' : ${fruits[0].endsWith('Red')}");
  print("[1] Index of 'Red' : ${fruits[0].indexOf('Red')}");
  print("[1] Trim '  Banana  '? : ${fruits[1].trim()}");
}
