import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        titleTextStyle: const TextStyle(),
        title: Padding(
          padding: const EdgeInsets.only(bottom: kspace, left: kspace),
          child: Row(
            children: [
              Image.asset(
                'assets/images/coatOfArms.png',
                width: 35,
                height: 35,
              ),
              const XMargin(ktinyspace),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Ministry of',
                    style: TextStyle(
                      color: AppColor.stormGrey,
                      //fontSize: 20,
                    ),
                  ),
                  Text(
                    'Commerce',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.stormGrey,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: ktinyspace, horizontal: kspace),
                margin: const EdgeInsets.only(left: kmediumSpace),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kLargeBorderRadius),
                  color: AppColor.pastelPink,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Agent',
                  style: TextStyle(
                      color: AppColor.health, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: AppColor.alabaster,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kspace, vertical: kmediumSpace),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('BUSINESS'),
                    YMargin(kspace),
                    Text(
                      'All businesses',
                      style: TextStyle(
                        color: AppColor.mineShaft,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.iron),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColor.stormGrey),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: ksmallSpace),
                    child: Row(
                      children: const [
                        Text('All businesses'),
                        Icon(Icons.keyboard_arrow_down_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(kspace),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: kspace),
                hintText: 'Search business places',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColor.mischka,
                ),
                hintStyle: const TextStyle(color: AppColor.mischka),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kTinyBorderRadius),
                  borderSide: const BorderSide(color: AppColor.iron),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kTinyBorderRadius),
                  borderSide: const BorderSide(color: AppColor.iron),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kTinyBorderRadius),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kTinyBorderRadius),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                //border: InputBorder.none,
              ),
            ),
            const YMargin(kmediumSpace),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(kspace),
                      decoration: const BoxDecoration(
                        color: AppColor.catskillWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kTinyBorderRadius),
                          topRight: Radius.circular(kTinyBorderRadius),
                        ),
                      ),
                      child: const Text(
                        'Name',
                        style: TextStyle(
                          color: AppColor.stormGrey,
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                          25,
                          (index) => ProductTile(
                                name: index.toString(),
                                hideDivider: index == 25 - 1,
                              )).toList(),
                    ),
                    const YMargin(kmediumSpace),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: size.width,
          decoration: const BoxDecoration(
            color: AppColor.matisse,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: AppColor.white,
              ),
              XMargin(ksmallSpace),
              Text(
                'Business place',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
