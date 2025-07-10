//Integer 클래스를 하나 생성한 후, va1 이라는 인스턴스 변수를 생성해보자
//Integer 클래스의 생성자는 203페이지의 생성자 생성 방법을 이용해서 작성해보자.
//Integer 클래스에서는 va1 이라는 인스턴스 변수를 return 하는 get 함수와
//값을 변경하는 set함수가 있어야함

//Interger 클래스를 extends 하는 GoodInteger 라는 클래스를 생성한다
//GoodInteger 클래스에 goodList 라는 List 형 인스턴스 변수를 생성해라
//goodList의 기본값은 []이다.
//Integer 클래스에 존재하는 set 함수를 @override 하여 값이 변경될 때마다
//goodList에 변경된 값을 저장하는 함수를 만들어라.
//goodList 의 값들을 return 하는 함수를 만들어라. =get?

class Integer {
  late int va1;
  //Integer 클래스를 하나 생성한 후, va1 이라는 인스턴스 변수를 생성해보자
  Integer([int givenValue = 01]) : va1 = givenValue;
  //Integer 클래스의 생성자는 203페이지의 생성자 생성 방법을 이용해서 작성해보자.
  int get() {
    return va1;
  }

  void set(int givenValu) {
    va1 = givenValu;
  }

  //Integer 클래스에서는 va1 이라는 인스턴스 변수를 return 하는 get 함수와
  //값을 변경하는 set함수가 있어야함
}

class GoodInteger extends Integer {
  //Interger 클래스를 extends 하는 GoodInteger 라는 클래스를 생성한다
  List<int> goodList = [];
  GoodInteger([int givenValue = 0]) {
    va1 = givenValue;
    //GoodInteger 클래스에 goodList 라는 List 형 인스턴스 변수를 생성해라
    //goodList의 기본값은 []이다.
  }

  @override
  void set(int givenValu) {
    goodList.add(va1);
    super.set(givenValu);
  }

  //goodList에 변경된 값을 저장하는 함수를 만들어라.
  List getold() {
    return goodList;
  }

  //goodList 의 값들을 return 하는 함수를 만들어라. =get?
}

void main() {
  var num1 = GoodInteger(9);
  print(num1.get());
  print(num1.getold());

  num1.set(1616);
  print(num1.get());
  print(num1.getold());
}
