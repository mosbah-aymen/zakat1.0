class Betail {
  static bool between(int valeur, int min, int max) {
    return valeur >= min && valeur <= max;
  }

  static Map<int, String> calculerChameaux(int valeur) {
    if (valeur < 5) {
      return {0: ""};
    } else if (between(valeur, 5, 24)) {
      return {valeur ~/ 5: "شاة"};
    } else if (between(valeur, 25, 35)) {
      return {1: "بنت مخاض"};
    } else if (between(valeur, 36, 45)) {
      return {1: "بنت لبون"};
    } else if (between(valeur, 46, 60)) {
      return {1: "حقة"};
    } else if (between(valeur, 61, 75)) {
      return {1: "جدعة"};
    } else if (between(valeur, 76, 90)) {
      return {2: "بنتا لبون"};
    } else if (between(valeur, 91, 120)) {
      return {2: "حقتان"};
    } else {
      int h = 0, l = 0;
      if (valeur % 50 < 10) {
        h = valeur ~/ 50;
      } else if (valeur % 40 < 10) {
        l = valeur ~/ 40;
      } else {
        h = valeur ~/ 50;
        l = (valeur - 50 * h) ~/ 40;
      }
      return {h: "حقة", l: "بنت لبون"};
    }
  }

  static Map<int, String> calculerBovin(int valeur) {
    int t = 0, m = 0;
    if (valeur % 30 < 10) {
      t = valeur ~/ 30;
    } else if (valeur % 40 < 10) {
      m = valeur ~/ 40;
    } else {
      t = valeur ~/ 30;
      m = (valeur - 30 * t) ~/ 40;
    }
    return {t: "تبيع", m: "مسنة"};
  }

  static int calculerOvin(int valeur) {
    if (valeur < 40) {
      return 0;
    } else if (between(valeur, 40, 120)) {
      return 1;
    } else if (between(valeur, 121, 200)) {
      return 2;
    } else if (between(valeur, 201, 399)) {
      return 3;
    } else {
      return valeur ~/ 100;
    }
  }
}
