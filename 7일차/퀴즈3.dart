// quiz2.dart 파일을 참고하여 다음의 기능들을 추가로 구현하세요.
// 1. GET 메서드를 사용해 모든 나라의 수도를 출력하는 기능을 구현하세요.
// 경로는 /all 이며,
// 반환되는 데이터는 JSON 형식이어야 합니다.
// 2. DELETE 메서드를 사용해 입력한 나라를 삭제하는 기능을 구현하세요.
// 경로는 /delete=나라이름 이며,
// 해당 데이터를 삭제한 후 남아있는 나라들을 반환해야 합니다.
// 반환되는 데이터는 JSON 형식이여야 합니다.

import 'dart:io';
import 'dart:convert';

void httpGetHandler(HttpRequest request) async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };
}
