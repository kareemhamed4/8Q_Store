import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:q8_store/modules/product_details/product_details_screen.dart';
import 'package:q8_store/shared/styles/colors.dart';

// ignore: non_constant_identifier_names
Future NavigateToReb({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));

// ignore: non_constant_identifier_names
Future NavigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget buildGridProduct({
  required Size size,
  required BuildContext context,
  required List<String> productImages,
  required List<String> companiesImages,
  required List<String> companiesNames,
  required List<String> productName,
  required List<String> productPrice,
  required List<String> productOldPrice,
  required int index,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: InkWell(
        onTap: (){
          NavigateTo(context: context, widget: ProductDetailsScreen(index: index,));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      color: myFavColor3,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 165,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Image.asset(
                          productImages.sublist(2, 5)[index],
                          fit: BoxFit.contain,
                        ),
                      )
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 15),
                  child: Icon(
                    FluentSystemIcons.ic_fluent_heart_regular,
                    color: myFavColor,
                  ),
                )),
            Container(
              height: size.height * 0.14,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: myFavColor.withOpacity(0.1),
                    spreadRadius: 0.6,
                    blurRadius: 0.6,
                    offset: const Offset(0, 0),
                  ),
                ],
                color: myFavColor5,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productName.sublist(2, 5)[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                      maxLines: 2,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(
                                companiesImages.sublist(2, 5)[index],
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              companiesNames.sublist(2, 5)[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: myFavColor6, fontSize: 10),
                            ),
                          ],
                        ),
                        Container(
                          width: 38,
                          height: 15,
                          decoration: BoxDecoration(
                            color: myFavColor.withOpacity(0.12),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text(
                              "خصم 20%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productPrice.sublist(2, 5)[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 12),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          productOldPrice.sublist(2, 5)[index],
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    color: myFavColor6,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildHotOffers({
  required Size size,
  required BuildContext context,
  required List<String> productImages,
  required List<String> companiesImages,
  required List<String> companiesNames,
  required List<String> productName,
  required List<String> productPrice,
  required List<String> productOldPrice,
  required int index,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Container(
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: myFavColor5,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: myFavColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productName[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage(companiesImages[index]),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              companiesNames[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: myFavColor6, fontSize: 8),
                            ),
                          ],
                        ),
                        Container(
                          width: 30,
                          height: 15,
                          decoration: BoxDecoration(
                            color: myFavColor.withOpacity(0.12),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text(
                              "خصم 20%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productPrice[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 12),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          productOldPrice[index],
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    color: myFavColor6,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                height: size.height * 0.1,
                width: size.width * 0.15,
                child: Image.asset(
                  productImages[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildAllHotOffersWithGrid({
  required Size size,
  required BuildContext context,
  required List<String> productImages,
  required List<String> companiesImages,
  required List<String> companiesNames,
  required List<String> productName,
  required List<String> productPrice,
  required List<String> productOldPrice,
  required int index,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: myFavColor3,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      productImages[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 15),
                child: Icon(
                  FluentSystemIcons.ic_fluent_heart_regular,
                  color: myFavColor,
                ),
              )),
          Container(
            height: size.height * 0.14,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: myFavColor.withOpacity(0.1),
                  spreadRadius: 0.6,
                  blurRadius: 0.6,
                  offset: const Offset(0, 0),
                ),
              ],
              color: myFavColor5,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      productName[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                      maxLines: 2,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage(
                              companiesImages[index],
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            companiesNames[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: myFavColor6, fontSize: 10),
                          ),
                        ],
                      ),
                      Container(
                        width: 38,
                        height: 15,
                        decoration: BoxDecoration(
                          color: myFavColor.withOpacity(0.12),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                          child: Text(
                            "خصم 20%",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productPrice[index],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 12),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        productOldPrice[index],
                        style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 12,
                                  color: myFavColor6,
                                  decoration: TextDecoration.lineThrough,
                                ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget buildBlackFridayBanner({
  required Size size,
  required BuildContext context,
}) =>
    SizedBox(
      height: size.height * 0.15,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: size.height * 0.115,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    myFavColor.withOpacity(0.35),
                    myFavColor,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "BLACK FRIDAY",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "30% off for all items",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: myFavColor5, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Image.asset(
              "assets/images/headphone.png",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );

Widget buildFavouriteScreen({
  required Size size,
  required BuildContext context,
  required List<String> productImages,
  required List<String> companiesImages,
  required List<String> companiesNames,
  required List<String> productName,
  required List<String> productPrice,
  required List<String> productOldPrice,
  required int index,
}) =>
    Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Container(
              height: 88,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: myFavColor5,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: myFavColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            productName[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(companiesImages[index]),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    companiesNames[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: myFavColor6, fontSize: 8),
                                  ),
                                ],
                              ),
                              Container(
                                width: 30,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: myFavColor.withOpacity(0.12),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Center(
                                  child: Text(
                                    "خصم 20%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productPrice[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 12),
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                productOldPrice[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12,
                                      color: myFavColor6,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      productImages[index],
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: myFavColor,
              child: Icon(
                Icons.close,
                color: myFavColor5,
                size: 15,
              ),
            )),
      ],
    );

Widget buildSocialIcons({
  required BuildContext context,
  required List<String> iconsNames,
  required int index,
}) =>
    CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 24,
      child: SvgPicture.asset(
        iconsNames[index],
      ),
    );

PreferredSizeWidget defaultTabBar({
  required BuildContext context,
  required TabController tabController,
}) => TabBar(
  padding: const EdgeInsets.symmetric(horizontal: 24),
  controller: tabController,
  physics: const BouncingScrollPhysics(),
  indicatorColor: myFavColor,
  isScrollable: true,
  tabs: [
    Tab(
      icon: Text(
        "الكل",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 0
                ? myFavColor
                : myFavColor6),
      ),
    ),
    Tab(
      icon: Text(
        "جوال",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 1
                ? myFavColor
                : myFavColor6),
      ),
    ),
    Tab(
      icon: Text(
        "لابتوب",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 2
                ? myFavColor
                : myFavColor6),
      ),
    ),
    Tab(
      icon: Text(
        "شاحن",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 3
                ? myFavColor
                : myFavColor6),
      ),
    ),
    Tab(
      icon: Text(
        "ساعة ذكية",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 4
                ? myFavColor
                : myFavColor6),
      ),
    ),
    Tab(
      icon: Text(
        "كاميرا",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(
            color: tabController.index == 5
                ? myFavColor
                : myFavColor6),
      ),
    ),
  ],
);

Widget defaultMaterialButton({
  required BuildContext context,
  required Color bgColor,
  required Color textColor,
  required String label,
}) => SizedBox(
  width: double.infinity,
  child: MaterialButton(
    onPressed: () {},
    height: 49,
    color: bgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide.none,
    ),
    child: Text(
      label,
      style: Theme.of(context).textTheme.button!.copyWith(color: textColor),
    ),
  ),
);