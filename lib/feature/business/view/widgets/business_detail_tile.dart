import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class BusinessDetailTile extends StatelessWidget {
  final String title;
  final String name;
  const BusinessDetailTile({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kspace, left: kspace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColor.waterloo),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColor.rhino,
              height: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
