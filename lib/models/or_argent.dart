class Metals {
  static int silverQuorum = 595;
  static int or24Quorum = 85;
  static int or21Quorum = 97;
  static int or18Quorum = 113;

  static int getQuorum(int carat) {
    return carat == 0
        ? silverQuorum
        : carat == 18
            ? or18Quorum
            : carat == 21
                ? or21Quorum
                : or24Quorum;
  }

  static bool hasQuorum(int carat, int quorum) {
    return getQuorum(carat) <= quorum;
  }

  static double calculate(double value) {
    return 0.025 * value;
  }

  static String getNameInArByCarat(int carat) {
    return carat == 24
        ? "الذهب عيار 24"
        : carat == 18
            ? "الذهب عيار 18"
            : carat == 21
                ? "الذهب عيار 21"
                : "الفضة";
  }

  static double getPriceByCarat(int carat) {
    return carat == 24
        ? 8323
        : carat == 18
            ? 6242
            : carat == 21
                ? 7282
                : 100.25;
  }
}
