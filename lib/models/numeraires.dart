class Numeric {
  static double quorum = 705500;

  static double calculate(double value) {
    return 0.025 * value;
  }

  static bool hasNissab(double value) {
    return value >= Numeric.quorum;
  }
}
