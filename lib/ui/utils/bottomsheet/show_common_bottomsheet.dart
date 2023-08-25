import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:flutter/material.dart';

showCommonBottomSheet(
    {required BuildContext context,
    required List<String> lists,
    required String title,
    required String selectedValue,
    required void Function(String sel) onTap}) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22.0),
        topRight: Radius.circular(22.0),
      )),
      builder: (context) {
        return Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 5),
              width: 80,
              height: 3,
              decoration: BoxDecoration(
                  color: kBlackColor, borderRadius: BorderRadius.circular(3))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                        text: title,
                        color: kTertiaryColor,
                        size: 18,
                        fontWeight: FontWeight.bold),
                    InkWell(
                        child: const LabelText(
                            text: "CANCEL", color: kBlackColor, size: 18),
                        onTap: () => Navigator.pop(context))
                  ])),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: lists.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: selectedValue == lists[index]
                    ? kPrimaryColor.withOpacity(0.2)
                    : Colors.transparent,
                child: ListTile(
                    title: LabelText(
                        text: lists[index], color: kBlackColor, size: 21),
                    onTap: () => onTap(lists[index])),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          )),
        ]);
      });
}
