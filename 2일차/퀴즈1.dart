void main() {
  int score = 70;
  var grade;

  if (score <= 50) {
    grade = "F";
  } else if (score <= 60) {
    grade = "E";
  } else if (score <= 70) {
    grade = "D";
  } else if (score <= 80) {
    grade = "C";
  } else if (score <= 90) {
    grade = "B";
  } else if (score <= 100) {
    grade = "A";
  }

  print("철수의 시험 점수는 $score 점이며, 등급은 $grade 입니다.");
}
