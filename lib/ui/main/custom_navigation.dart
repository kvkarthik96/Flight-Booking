import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onChange;
  final List<String> iconList;

  final List<String> iconTitle;
  const CustomBottomNavigationBar(
      {Key? key,
      this.selectedIndex = 0,
      required this.iconList,
      required this.iconTitle,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(iconList[i], i, iconTitle[i]));
    }

    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.19),
              blurRadius: 2,
              offset: const Offset(0, -2))
        ]),
        child: Row(children: navBarItemList),
      ),
    );
  }

  Widget buildNavBarItem(String icon, int index, String title) {
    return InkWell(
      onTap: () {
        onChange!(index);
      },
      child: SizedBox(
        height: 60,
        width: 1.sw / iconList.length - 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Stack(children: [
                  Image.asset(icon,
                      height: index == selectedIndex ? 28.h : 24.h,
                      width: index == selectedIndex ? 28.h : 24.h,
                      color: index == selectedIndex
                          ? kPrimaryColor
                          : kTertiaryColor)
                ])),
            Center(
                child: LabelText(
                    text: title,
                    color:
                        index == selectedIndex ? kPrimaryColor : kTertiaryColor,
                    size: 14,
                    fontWeight: index == selectedIndex
                        ? FontWeight.w600
                        : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
