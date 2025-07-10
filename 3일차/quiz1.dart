//1 부터 100 까지 짝수 에 해당하는 수만 list 담아서 출력
void main() {
  List list = [];

  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      list.add(i);
    }
  }
  print(list);
}
