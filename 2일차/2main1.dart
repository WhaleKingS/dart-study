void main() {
  int i;
  int dan;
  //for
  for (dan = 2; dan <= 8; dan = dan + 2) {
    for (i = 1; i < 10; i++) {
      print("$dan X $i = ${dan * i}");
    }
  }

  for (i = dan = 1; i < 10; i++) {
    if (i % 2 == 0) {
      while (dan <= 10) {
        print("$i X $dan = ${i * dan}");
        dan++;
      }
      dan = 1;
    }
  }
}
