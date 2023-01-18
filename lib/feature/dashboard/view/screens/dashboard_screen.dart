import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/feature/dashboard/view/widgets/dashboard_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: kspace, vertical: kmediumSpace),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('DASHBOARD'),
                    YMargin(kspace),
                    Text(
                      'Overview',
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
                        MaterialStateProperty.all<Color>(AppColor.matisse),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColor.white),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: ksmallSpace),
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text('Business Place'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(kLargeSpace),
            //revenue card
            Container(
              width: size.width,
              padding: const EdgeInsets.only(
                  right: kspace,
                  left: kspace,
                  top: kspace,
                  bottom: kLargeSpace),
              decoration: BoxDecoration(
                color: AppColor.catskillWhite,
                borderRadius: BorderRadius.circular(kTinyBorderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Revenue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.matisse,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColor.curiousBlue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(AppColor.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: ksmallSpace),
                          child: Row(
                            children: const [
                              Text('Today'),
                              Icon(Icons.keyboard_arrow_down_outlined),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(kLargeSpace),
                  RichText(
                    text: TextSpan(
                      text: 4500880.currency,
                      style: const TextStyle(
                        color: AppColor.eden,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      children: const [
                        TextSpan(
                          text: '.00',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const YMargin(kspace),
                  const Text(
                    'REVENUE COLLECTED',
                    style: TextStyle(
                      color: AppColor.mineShaft,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const YMargin(kspace),
            SizedBox(
              height: 125,
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DashboardTile(
                      count: 1,
                      label: 'Applications',
                      color: Colors.red,
                      icon: const Icon(Icons.notes, color: Colors.red),
                      onpressed: () {},
                    ),
                    DashboardTile(
                      count: 67000,
                      label: 'My Businesses',
                      color: AppColor.dairyCream,
                      icon: const Icon(Icons.business_center_outlined,
                          color: AppColor.goBen),
                      onpressed: () {},
                    ),
                    DashboardTile(
                      count: 12,
                      label: 'Sub-Agents',
                      color: AppColor.goblin,
                      icon: const Icon(Icons.people_outline,
                          color: AppColor.goblin),
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const YMargin(kspace),
            const Text(
              'My Businesses',
              style: TextStyle(
                color: AppColor.mineShaft,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(ksmallSpace),
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
                  4,
                  (index) => ProductTile(
                        name: index.toString(),
                        hideDivider: index == 4 - 1,
                      )).toList(),
            ),
            const YMargin(kmediumSpace),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: size.width,
          decoration: const BoxDecoration(
            color: AppColor.easternBlue,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.link_rounded,
                color: AppColor.white,
              ),
              XMargin(ksmallSpace),
              Text(
                'Link Demand Notice',
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
