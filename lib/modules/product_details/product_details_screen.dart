import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/shared/components/components.dart';
import 'package:q8_store/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;
  const ProductDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late int index = widget.index;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        MainCubit cubit = BlocProvider.of(context);
        List<ProductDetailsModel> productDetails = [
          ProductDetailsModel(
            image: index == 1
                ? 'assets/images/iphone.png'
                : "assets/images/laptop.png",
          ),
          ProductDetailsModel(
            image: index == 1
                ? 'assets/images/iphone2.png'
                : "assets/images/laptop2.png",
          ),
          ProductDetailsModel(
            image: index == 1
                ? 'assets/images/iphone3.png'
                : "assets/images/laptop3.png",
          ),
          ProductDetailsModel(
            image: index == 1
                ? 'assets/images/iphone4.png'
                : "assets/images/laptop2.png",
          ),
        ];
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                backgroundColor: myFavColor5,
                expandedHeight: size.height * 0.4,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(FluentSystemIcons.ic_fluent_search_regular),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: size.height * 0.6,
                        width: double.infinity,
                        color: myFavColor3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 4,
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            activeDotColor: myFavColor,
                            dotColor: myFavColor4,
                            dotHeight: 6,
                            dotWidth: 20,
                          ),
                        ),
                      ),
                      PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        controller: pageController,
                        itemBuilder: (context, index) =>
                            buildProductDetailsImage(
                                context: context,
                                size: size,
                                model: productDetails[index]),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height - (size.height * 0.439),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 21,
                                  backgroundImage: AssetImage(
                                    cubit.companiesImages.sublist(2, 5)[index],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  cubit.companiesNames
                                      .sublist(2, 5)[index]
                                      .replaceAll(RegExp(r'\)|\('), ''),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cubit.productPrice.sublist(2, 5)[index],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  cubit.productOldPrice.sublist(2, 5)[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 12,
                                        color: myFavColor6,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: size.width * 0.5,
                              child: Text(
                                cubit.productName.sublist(2, 5)[index],
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "(555)",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12,
                                      color: myFavColor6,
                                    ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Icon(
                                FluentSystemIcons.ic_fluent_star_regular,
                                size: 16,
                                color: myFavColor6,
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Flexible(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Icon(
                                    FluentSystemIcons.ic_fluent_star_filled,
                                    color: myFavColor8,
                                    size: 16,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 2,
                                  ),
                                  itemCount: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "تفاصيل المنتج",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.changeExpandedText();
                              },
                              child: Icon(
                                cubit.textExpandedIcon,
                                color: myFavColor7,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (cubit.isTextExpanded)
                          Flexible(
                            fit: FlexFit.loose,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.7,
                                child: Text(
                                  "Brand 	Apple Wireless carrier 	Unlocked for All Carriers Memory storage capacity 	256 GB Screen size 	6.1 Inches Form factor 	Slate Model year 	2022 Item weight 	0.38 Kilograms",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 14,
                                        color: myFavColor7,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (context) {
                                  return SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "اللون",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!.copyWith(fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "قرمزي",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor:
                                                        HexColor("#766D7E"),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "أحمر",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor: Colors.red,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "أسود",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor: myFavColor,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "أزرق",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor:
                                                        HexColor("#1957DC"),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: myFavColor5,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: myFavColor.withOpacity(0.1),
                                  spreadRadius: 0.6,
                                  blurRadius: 0.6,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "اللون",
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20,
                                    color: myFavColor7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: defaultMaterialButton(
                                  bgColor: myFavColor,
                                  textColor: myFavColor5,
                                  context: context,
                                  label: "الذهاب إلى الشراء"),
                            ),
                            const SizedBox(
                              width: 28,
                            ),
                            Expanded(
                              child: defaultMaterialButton(
                                  bgColor: myFavColor3,
                                  textColor: myFavColor,
                                  context: context,
                                  label: "أضف إلى المفضلة"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductDetailsModel {
  final String image;

  ProductDetailsModel({
    required this.image,
  });
}

Widget buildProductDetailsImage({
  required BuildContext context,
  required Size size,
  required ProductDetailsModel model,
}) =>
    Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset(
          model.image,
          fit: BoxFit.contain,
        ),
      ),
    );
