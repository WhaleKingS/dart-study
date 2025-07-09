double bmi(double m, int kg) {
  double score = 0.0;
  score = kg / (m * m);
  return score;
}

void main() {
  print(bmi(1.76, 63));
}
