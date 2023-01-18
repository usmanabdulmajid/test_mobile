import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class ProductTile extends StatelessWidget {
  final String name;
  final bool hideDivider;
  final VoidCallback? onpressed;
  const ProductTile({
    Key? key,
    required this.name,
    this.hideDivider = false,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: AppColor.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     offset: const Offset(-2, 0),
          //     blurRadius: 2,
          //     spreadRadius: -9,
          //   ),
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     offset: const Offset(2, 0),
          //     blurRadius: 4,
          //   ),
          // ],
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(ksmallSpace),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColor.stormGrey,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColor.stormGrey,
                  ),
                ],
              ),
            ),
            if (!hideDivider)
              const Divider(
                color: AppColor.waterloo,
                height: 0,
              ),
          ],
        ),
      ),
    );
  }
}
