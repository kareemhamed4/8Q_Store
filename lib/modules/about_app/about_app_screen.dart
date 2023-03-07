import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/shared/components/components.dart';
import 'package:q8_store/shared/styles/colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "عن التطبيق",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/images/logo with name.svg",
                          width: 70,
                          height: 70,
                        )),
                    const SizedBox(
                      height: 42,
                    ),
                    Text(
                      "عن الشركة",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        "تطبيق 8Q Store معرض للشركات لحجز او شراء المنتجات من خلال شركات و متاجر في دولة الكويت",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            color: myFavColor7
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "للتواصل",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => buildSocialIcons(
                                context: context,
                                index: index,
                                iconsNames: cubit.socialIcons,
                              ),
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 15,
                              ),
                              itemCount: cubit.socialIcons.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 62,
                    ),
                    Text(
                      "للشكاوي او الاقتراحات",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: myFavColor.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: TextField(
                          cursorColor: myFavColor,
                          cursorHeight: 20,
                          maxLines: 10,
                          expands: false,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'اضافة شكوي او اقتراح',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: myFavColor2),
                            filled: true,
                            fillColor: myFavColor5,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    defaultMaterialButton(
                      bgColor: myFavColor,
                      textColor: myFavColor5,
                      context: context,
                      label: "ارسال"
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
