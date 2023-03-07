import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:q8_store/layout/layout_screen.dart';
import 'package:q8_store/shared/components/components.dart';
import 'package:q8_store/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String header;
  final String body;

  BoardingModel({
    required this.image,
    required this.header,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/on_boarding 1.png',
      header: 'تسوق اون لاين',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding 2.png',
      header: 'عروض و خصومات',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding 3.png',
      header: 'الدفع الآمن',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس\n المساحة، لقد تم توليد هذا النص من مولد النص العربى، ',
    ),
  ];
  PageController pageController = PageController();
  PageController pageImageController = PageController();
  bool isLast = false;
  int pageIndex = 0;
  double indicatorValue = 0.3;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: boarding.length,
              controller: pageImageController,
              itemBuilder: (context, index) => buildPageViewImage(
                  context: context, size: size, model: boarding[index]),
            ),
            Container(
              width: size.width,
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.0381,
                  ),
                  SvgPicture.asset(
                    "assets/images/logo with name.svg",
                    width: 47,
                    height: 63.91,
                  ),
                  SizedBox(
                    height: size.height * 0.0296,
                  ),
                  SizedBox(
                    height: size.height * 0.1145,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      itemCount: boarding.length,
                      itemBuilder: (context, index) => buildPageViewScreen(
                          context: context, size: size, model: boarding[index]),
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                          if (index == 0) {
                            indicatorValue = 0.3;
                          } else if (index == 1) {
                            indicatorValue = 0.6;
                          } else {
                            indicatorValue = 1;
                          }
                        });
                        if (index == (boarding.length - 1)) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.032,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      activeDotColor: myFavColor,
                      dotColor: myFavColor4,
                      dotHeight: 6,
                      dotWidth: 20,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.032,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (pageIndex != 0)
                        TextButton(
                          onPressed: () {
                            pageController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                            pageImageController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text(
                            "السابق",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: pageIndex != 0 ? 64 : 0),
                        child: InkWell(
                          onTap: () {
                            if (isLast) {
                              NavigateToReb(
                                  context: context, widget: const LayoutScreen());
                            } else {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn);
                              pageImageController.nextPage(
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  color: myFavColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: myFavColor5,
                                ),
                              ),
                              SizedBox(
                                height: 82,
                                width: 82,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: 1,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(myFavColor4),
                                ),
                              ),
                              SizedBox(
                                height: 82,
                                width: 82,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: indicatorValue,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(myFavColor),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.0566,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 44,
                  right: 15,
                ),
                child: Container(
                  width: 71,
                  height: 33,
                  decoration: BoxDecoration(
                    color: myFavColor.withOpacity(0.24),
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        NavigateToReb(
                          context: context,
                          widget: const LayoutScreen(),
                        );
                      },
                      child: Text(
                        "تخطي",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: myFavColor5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPageViewScreen({
  required BuildContext context,
  required Size size,
  required BoardingModel model,
}) =>
    Column(
      children: [
        Text(
          model.header,
          style: Theme.of(context).textTheme.headline5!.copyWith(height: 1.4),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );

Widget buildPageViewImage({
  required BuildContext context,
  required Size size,
  required BoardingModel model,
}) =>
    Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        model.image,
        fit: BoxFit.cover,
        width: size.width,
      ),
    );
