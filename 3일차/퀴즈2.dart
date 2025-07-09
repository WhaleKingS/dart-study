void main() {
  //문자열 "가~하" 를 포한한 set하나 생성

  Set setfill = {"가", "나", "다", "라", "마", "바", "사"};
  Set setfill2 = {"라", "마", "바", "사", "아", "자", "치", "카", "타", "파", "하"};
  Set set1 = setfill.union(setfill2);
  Set set2 = setfill.intersection(setfill2);
  Set set3 = setfill.difference(setfill2);

  print(set1);
  print(set2);
  print(set3);

  Map fruit = {"apple": 10, "banana": 5, "mango": 3};
  int count = 0;

  if (fruit.containsKey("mango")) {
    count = fruit["mango"];

    print("이 상점에서는 망고를 $count개 판매하고 있습니다.");

    fruit["mango"] = fruit["mango"] - 2;

    print(fruit);
  }
}
