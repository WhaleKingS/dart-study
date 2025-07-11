// 가계를 뜻하는 shop 클래스를 만들어라
// 이 shop 클래스는 어떤 물건을 파는지라는 뜻을 가진
// item 이라는 인스턴스 변수를 가지고 있다.
// 이 가게에서는 여러가지 물건을 번갈아가며 팔고 있는데,
// 다음과 같은 main 함수가 있다고 가정할때 이 기능을 정상적으로 동작하는 generic 클래스 만들기

class Shop<T> {
  late dynamic item;

  Shop(T givenItem) {
    item = givenItem;
  }

  void changeItem(dynamic inputitem) {
    item = inputitem;
  }

  dynamic getSellingItem() {
    return item;
  }
}

void main() {
  var shop = Shop("아디다스");

  shop.changeItem("청바지");
  print(shop.getSellingItem()); // 출력값 [청바지]

  shop.changeItem(100.1);
  print(shop.getSellingItem()); // 출력값 [100.1]

  var shop2 = Shop(123);
  shop2.changeItem(23232323232);
  print(shop2.getSellingItem());
}
