import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deep_byte/res/color_const.dart';
import 'package:flutter/material.dart';

showAwesomeDailog(
    {required BuildContext context,
    required bool isWinnerFound,
    required String resultText}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: isWinnerFound ? DialogType.SUCCES : DialogType.WARNING,
    title: isWinnerFound ? 'Congratulations' : 'Match Draw',
    desc: resultText,
    descTextStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: kPrimaryColor),
    btnOkColor: isWinnerFound ? Colors.green : Colors.orange,
    btnOkOnPress: () {},
  ).show();
}
