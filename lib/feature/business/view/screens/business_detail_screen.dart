import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/feature/business/view/widgets/business_detail_tile.dart';

class BusinessDetailScreen extends StatelessWidget {
  const BusinessDetailScreen({Key? key}) : super(key: key);

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
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: kspace, vertical: kmediumSpace),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kTinyBorderRadius),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kmediumSpace, vertical: kLargeSpace),
                    color: AppColor.chathamsBlue,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColor.wedgeWood,
                                borderRadius:
                                    BorderRadius.circular(kTinyBorderRadius),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.business_center_outlined,
                                color: AppColor.mischka,
                              ),
                            ),
                            const XMargin(kspace),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Paragraph Limited',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const YMargin(kspace),
                                Container(
                                  padding: const EdgeInsets.all(ksmallSpace),
                                  decoration: BoxDecoration(
                                    color: AppColor.frenchPass,
                                    borderRadius:
                                        BorderRadius.circular(kborderRadius),
                                  ),
                                  child: const Text(
                                    'Informal sector',
                                    style: TextStyle(
                                      color: AppColor.mineShaft,
                                    ),
                                  ),
                                ),
                                const YMargin(kspace),
                                const Text(
                                  'ID:MCI-23-02-000001',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.mischka,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kmediumSpace, vertical: kspace),
                    color: AppColor.white,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        DottedBorder(
                          color: AppColor.chathamsBlue,
                          child: const Padding(
                            padding: EdgeInsets.all(ktinyspace),
                            child: Text(
                              'General Information',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.chathamsBlue,
                              ),
                            ),
                          ),
                        ),
                        const XMargin(kspace),
                        const Text(
                          'Applications',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.stormGrey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const YMargin(kxtraLargeSpace),
          const BusinessDetailTile(
              title: 'Address', name: '14 Ogboko Street, Mgbuoba Obio-Apkor'),
          const BusinessDetailTile(title: 'L.G.A', name: 'Obio-Apkor'),
          const BusinessDetailTile(title: 'Ward', name: 'Obio-Apkor'),
          const BusinessDetailTile(title: 'Phone', name: '08012345678'),
          const BusinessDetailTile(title: 'Email', name: 'dummytest@gmail.com'),
        ],
      ),
    );
  }
}
