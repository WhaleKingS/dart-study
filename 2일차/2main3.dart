void printMessage(var header, var message) {
  print("[$header] $message");
}

void main() {
  print("[1] Integer Class");
  int iInteger = 3;
  printMessage("1-1", iInteger.abs());
  printMessage("1-2", iInteger.gcd(6));
  printMessage("1-3", iInteger.toString());
  printMessage("1-4", 2.abs());
  printMessage("1-5", 2.gcd(6));
  printMessage("1-6", 2.toString());

  print("[2] Double Class");
  double dDouble = 3.8;
  printMessage("2-1", dDouble.abs());
  printMessage("2-2", dDouble.toString());
  printMessage("2-3", dDouble.floor());
  printMessage("2-4", dDouble.round());
  printMessage("2-5", 1.8.abs());
  printMessage("2-6", 1.8.toString());
  printMessage("2-7", 1.8.floor());
  printMessage("2-8", 1.8.round());
}
