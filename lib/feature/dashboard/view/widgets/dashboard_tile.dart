import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class DashboardTile extends StatelessWidget {
  final int count;
  final String label;
  final Widget icon;
  final Color color;
  final VoidCallback? onpressed;
  const DashboardTile({
    Key? key,
    required this.count,
    required this.label,
    required this.icon,
    required this.color,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onpressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.only(
            top: kspace,
            bottom: kspace,
            right: kLargeSpace,
            left: kmediumSpace),
        margin: const EdgeInsets.symmetric(
            vertical: kspace, horizontal: ksmallSpace),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(kTinyBorderRadius),
          //border: Border(bottom: BorderSide(color: color),),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, -2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            const XMargin(kspace),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count.currency.replaceRange(0, 1, ''),
                  style: const TextStyle(
                      color: AppColor.mineShaft,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const YMargin(ksmallSpace),
                Text(
                  label,
                  style:
                      const TextStyle(fontSize: 14, color: AppColor.mineShaft),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
