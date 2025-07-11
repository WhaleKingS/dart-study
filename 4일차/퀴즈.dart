// 클래스 내에서 같은 이름을 가진 함수를 사용할 수 있다. X
//추상 클래스는 main() 함수에서 사용할 수 있다. X
//클래스 내에서 연산자를 함수명으로 사용해야 할때 연산자 앞에 무엇을 작성해야하는가?
//operater을 앞에 붙어줘야한다.

//사람을 뜻하는 Human 클래스를 생성하고,
//이름 나이 성별을 담을 수 있는 인스턴스 변수를 생성하세요
//모든 값들은 클래스 호출 시 필수적으로 입력해야 하며,
//생성자를 작성할 땐 named parameter를 이용해야 합니다. 교재 106p
//이후 사용자의 정보를 출력하는 함수인 profile을 구현해야 하며 다음의 내용을 출력해야한다.
//[안녕하세요. 제 이름은 김철수 이며, 16살 남성입니다.]

class Human {
  late String name;
  late int age;
  late String gender;

  //기본적으로 생성자를 반드는 방법
  // Human(String givenname, int givenage, String givensex) {
  //   name = givenname;
  //   age = givenage;
  //   gender = givensex;
  // }

  //name parmeter를 이용해 생성자를 만드는 방법
  Human({
    required String givenname,
    required int givenage,
    required String givensex,
  }) {
    name = givenname;
    age = givenage;
    gender = givensex;
  }

  String profile() {
    return "[안녕하세요. 제 이름은 $name 이며, $age살 $gender입니다.]";
  }

  void set(String givenname, int givenage, String givensex) {
    name = givenname;
    age = givenage;
    gender = givensex;
  }
}

void main() {
  var pl1 = Human(givenname: "rnjsoxdbs", givenage: 12, givensex: "남자");

  print(pl1.profile());
}
