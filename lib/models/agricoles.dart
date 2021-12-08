class Agricoles {
  static double calculate(double value, bool isNatural) {
    return isNatural ? 0.1 * value : 0.05 * value;
  }
}
