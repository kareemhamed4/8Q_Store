import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/modules/company_details/company_details_screen.dart';
import 'package:q8_store/shared/components/components.dart';
import 'package:q8_store/shared/styles/colors.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        MainCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "الشركات",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildCompaniesScreen(
                              size: size,
                              context: context,
                              index: index,
                              companiesNames: cubit.companiesNames,
                              companiesImages: cubit.companiesImages,
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 0,
                            ),
                        itemCount:
                            cubit.companiesNames.toSet().toList().length),
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

Widget buildCompaniesScreen({
  required BuildContext context,
  required Size size,
  required int index,
  required List<String> companiesNames,
  required List<String> companiesImages,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          NavigateTo(
              context: context,
              widget: CompanyDetailsScreen(
                index: index,
              ));
        },
        child: Container(
          height: 62,
          decoration: BoxDecoration(
            color: myFavColor5,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
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
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage:
                          AssetImage(companiesImages.toSet().toList()[index]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      companiesNames
                          .toSet()
                          .toList()[index]
                          .replaceAll(RegExp(r'\)|\('), ''),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "+349",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.favorite,
                      color: myFavColor,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
