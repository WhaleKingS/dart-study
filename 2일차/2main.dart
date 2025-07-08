void main(){
  // || = or 
  // 사용자 회원가입시 이름과 전화번호 필수로 입력시 &&사용
  String a = 'banan';

  switch(a){
    case '1':
      print("object");
      break;
    case 'banana':
      print("banana");
      break;
    default:
      print("no case");
  }

  
  if(a=='banana'){
    print('banana');
  } else if(a!='banana') {
    print('none');
  }

  if(a == "1") {
    print("object");
  } else if (a == 'apple') {
    print("apple");
  } else {
    print("no case");
  }

}