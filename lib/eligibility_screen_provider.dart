import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String eligibilityMessage = '';
  bool isEligible = false;

  void checkEligibility(int age) {
    if (age >= 18) {
      eligibilityLicense();
    } else {
      notEligibleForLicense();
    }
  }

  void eligibilityLicense() {
    eligibilityMessage = 'You are eligible to apply driving license';

    isEligible = true;
    notifyListeners();
  }

  void notEligibleForLicense() {
    eligibilityMessage = 'You are not eligible to apply driving license';
    isEligible = false;
    notifyListeners();
  }
}
