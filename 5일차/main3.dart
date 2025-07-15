void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  try {
    result = num1 ~/ num2;
  } catch (error) {
    print(error);
  }

  print("결과는 : $result 입니다.");
}
