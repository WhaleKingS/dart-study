//1. 컴퓨터는 항상 모든 작업을 동기로 진행함 한줄씩 차례로 실행하는 동기적인 언어
//2. 우리가 어느 작업을 하다가 반드시 진행해야 하는 작업이 필요한 경우, 이때 비동기를 이용하게 됨
//    예) 서버 통신
//3. 비동기를 이용하기 위해서는 비동기가 작동해야 하는 부분(함수)가 async로 선언되어 있어야함.
//4. async가 작성된 함수에서 await를 만나게 될 경우, 컴퓨터는 await에 대한하는 부분이
//   만족할 때 까지 기다리고 있다가, 해당 await 부분을 만족하는 상황이 발생하게 되면 다음 코드로 넘어감

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

void main() async {
  var finished = Flag(false);

  print("밥 주문하기");

  await doBG(5, finished);

  while (finished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }

  print("밥 먹기");
}
