import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/shared/components/components.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
              "المفضلة",
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
                        itemBuilder: (context, index) => buildFavouriteScreen(
                              size: size,
                              context: context,
                              productImages: cubit.productImages,
                              companiesImages: cubit.companiesImages,
                              companiesNames: cubit.companiesNames,
                              productName: cubit.productName,
                              productPrice: cubit.productPrice,
                              productOldPrice: cubit.productOldPrice,
                              index: index,
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: cubit.productName.length
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
