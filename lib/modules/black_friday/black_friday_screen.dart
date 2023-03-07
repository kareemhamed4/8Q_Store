import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/shared/components/components.dart';

class BlackFridayScreen extends StatelessWidget {
  const BlackFridayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state){
        Size size = MediaQuery.of(context).size;
        MainCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "BLACK FRIDAY",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  buildBlackFridayBanner(
                    context: context,
                    size: size,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: size.width / (size.height / 1.4),
                    children: List.generate(
                      7,
                          (index) =>
                          buildAllHotOffersWithGrid(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
