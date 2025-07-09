//1부터 10 까지 그다음 첫번째에 9 넣기
void main() {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  list.insert(0, 9);

  print(list);
  print(list.indexOf(6));

  List<String> llist = ["1", "2", "3"];

  list.addAll(llist);

  print(list);
}
