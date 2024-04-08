import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class Mass extends ChangeNotifier {
  String result = "";
  String weight = "";
  String height = "";
  String msg = "";
  bool isWeightSelected = true;
  bool isHeightSelected = false;
  double answer = 0;
  Color? color;

  void onHeightPressed() {
    isHeightSelected = !isHeightSelected;
    isWeightSelected = !isWeightSelected;
    notifyListeners();
  }

  void onWeightPressed() {
    isHeightSelected = !isHeightSelected;
    isWeightSelected = !isWeightSelected;
    notifyListeners();
  }

  void kilo(String enterNumber) {
    if (isWeightSelected == true) {
      weight += enterNumber;
    }
    notifyListeners();
  }

  void inches(String enterNumber) {
    if (isHeightSelected == true) {
      height = height + enterNumber;
    }
    notifyListeners();
  }

  void deleteButton() {
    if (isHeightSelected == true) {
      height = height.substring(0, height.length - 1);
    } else if (isWeightSelected == true) {
      weight = weight.substring(0, weight.length - 1);
    } else {
      return;
    }
    notifyListeners();
  }

  void bmiResult(String weight, String height) {
    double number1 = double.parse(weight);
    double number2 = double.parse(height);
    double number22 = number2 / 100;

    debugPrint('$number1 $number2');

    answer = number1 / (number22 * number22);

    if (answer < 18.5) {
      msg = "Underweight";
      color = Colors.blue;
    } else if (answer >= 18.5 && answer < 25.0) {
      msg = "Normal";
      color = Colors.green;
    } else if (answer >= 25 && answer < 30.0) {
      msg = "Overweight";
      color = Colors.red;
    } else {
      msg = "Obese";
      color = AppColors.secondaryColor;
    }


    answer.toString();
    result += answer.toStringAsFixed(2);
    notifyListeners();
  }

  void resetResult() {
    result = "";
    notifyListeners();
  }

  void reset() {
    weight = "";
    height = "";
    notifyListeners();
  }
}
