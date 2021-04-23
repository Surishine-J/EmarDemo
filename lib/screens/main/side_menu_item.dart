import 'package:emar_demo/components/constants.dart';
import 'package:emar_demo/components/counter_badge.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key key,
    this.isActive = false,
    this.isHover = false,
    this.itemCount,
    this.showBorder = true,
    @required this.gradientIcon,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final int itemCount;

  final String title;

  final Icon gradientIcon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.only(top: 22, bottom: 22),
      child: InkWell(
        onTap: press,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
                    "assets/Icons/Angle right.svg",
                    width: 25,
                    height: 25,
                  )
                : SizedBox(width: 15),
            SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 2),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  // Spacer(),
                  children: [
                    gradientIcon,

                    SizedBox(width: kDefaultPadding * 0.75), //0.75
                    Text(
                      title,
                      style: TextStyle(
                        color: (isActive || isHover) ? kTextColor : kGrayColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        fontFamily: 'Prompt',
                      ),
                    ),
                    Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
