class MatrixNumbers {
  int x;
  int y = round(random(-height-200, 0-200));
  int rDSize = round(random(10, 20));
  MatrixNumbers(int X) {
    x = X;
  }
  void update() {
    textSize(15);
    y = y+rDSize;
    for (int i = 0; i < rDSize; i++) {
      fill(purple, i*10);
      text(round(random(0, 1)), x, y+i*15);
    }
    if (y > height-100) {
      y = round(random(-height-200, 0-200));
      rDSize = round(random(10, 20));
    }
  }
}
