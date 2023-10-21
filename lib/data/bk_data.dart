class Bkdata {
  double width;
  double height;
  bool togglebk;

  Bkdata(this.width, this.height, this.togglebk);

  void togglerBk() => togglebk = !togglebk;

  double hToggler() => togglebk ? height += 100 : height;
}
