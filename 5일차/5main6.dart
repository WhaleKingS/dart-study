// 함수에 async로 작성이 되어있고, 이 함수 내에서 값을 반환해야 하는 경우,
// 반환할 값을 Future<>로 감싸줘야 함.
//
doBG(int time, var jobEnd) {
  if (time > 0) {
    print("$time초 남았습니다.");
    Future.delayed(Duration(seconds: 1), () => doBG(time - 1, jobEnd));
  } else {
    print("밥이 준비 되었습니다");
    jobEnd.activated = true;
  }
}

class Flag {
  late bool _flag;

  Flag(bool givenFlag) : _flag = givenFlag;
  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

Future<String> serveCustomer() async {
  print("serveCustomer 고객 주문 대기중");

  // customerOrder 변수는 simulateCustimerOrder 함수 앞에 await를 작성했는데,
  // 이 말은 simulateCustomerOrder() 함수가 동작할 때 까지, 밑에 있는 코드를 실행 안하겠다.
  // print() 는 sim~ 함수가 동작하기 전까지 실행하지 않겠다 라는 의미를 가짐.

  var customerOrder = await simulateCustomerOrder();
  print("serveCustomer: 고객의 주문 '$customerOrder'를 받음");

  return customerOrder;
}

// 반환할 값이 Future인 경우, 함수에 async가 붙어있지 않아도 Future<>를 감싸줘야 한다.
Future<String> simulateCustomerOrder() {
  return Future.delayed(Duration(seconds: 2), () => '아이스 커피');
}

void main() async {
  var finished = Flag(false);

  print("main: 메인 함수 실행");

  await doBG(5, finished);

  var customerOrder = await serveCustomer();
  print("main: 고객의 주문을 받음 : $customerOrder");

  print("main: 메인 함수 종료");
}
