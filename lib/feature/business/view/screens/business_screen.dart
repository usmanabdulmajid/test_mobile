import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/feature/business/view/screens/business_detail_screen.dart';
import 'package:test_mobile/feature/business/viewmodel/business_viewmodel.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BusinessViewmodel>().getBusinesses();
    });
  }

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
              controller: searchController,
              onChanged: (value) {
                context.read<BusinessViewmodel>().searchBusiness(value);
              },
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    searchController.clear();
                    await context.read<BusinessViewmodel>().getBusinesses();
                  },
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
                      Consumer<BusinessViewmodel>(
                        builder: (context, model, child) {
                          if (model.loading) {
                            return Column(
                              children: const [
                                YMargin(kLargestSpace),
                                Text('Loading....'),
                              ],
                            );
                          }
                          if (!model.loading &&
                              model.error.description.isNotEmpty) {
                            Alert.show(context,
                                description: model.error.description);
                            return Column(
                              children: [
                                const YMargin(kspace),
                                IconButton(
                                  onPressed: () async {
                                    searchController.clear();
                                    await context
                                        .read<BusinessViewmodel>()
                                        .getBusinesses();
                                  },
                                  icon: const Icon(Icons.refresh),
                                ),
                                const Text('Retry'),
                              ],
                            );
                          }
                          if (!model.loading &&
                              model.error.description.isEmpty &&
                              model.businesses.isEmpty &&
                              searchController.text.isEmpty) {
                            return Column(
                              children: const [
                                YMargin(kspace),
                                Text('No business available'),
                              ],
                            );
                          }
                          if (searchController.text.isNotEmpty &&
                              model.businesses.isEmpty) {
                            return Column(
                              children: const [
                                YMargin(kspace),
                                Text('No result found'),
                              ],
                            );
                          }
                          return Column(
                            children: List.generate(
                                model.businesses.length,
                                (index) => ProductTile(
                                      name: model.businesses[index].title ?? '',
                                      hideDivider:
                                          index == model.businesses.length - 1,
                                    )).toList(),
                          );
                        },
                      ),
                      const YMargin(kmediumSpace),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessDetailScreen(),
            ),
          );
        },
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
