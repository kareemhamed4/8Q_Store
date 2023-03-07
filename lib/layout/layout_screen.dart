import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/custom_icons_icons.dart';
import 'package:q8_store/layout/cubit/cubit.dart';
import 'package:q8_store/layout/cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){
        LayoutCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: SizedBox(
            height: 66,
            child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Column(
                    children: const [
                      Icon(FluentSystemIcons.ic_fluent_home_regular,size: 25,),
                      SizedBox(height: 4,),
                    ],
                  ), label: "الرئيسية"),
                  BottomNavigationBarItem(icon: Column(
                    children: const [
                      Icon(FluentSystemIcons.ic_fluent_heart_regular,size: 25,),
                      SizedBox(height: 4,),
                    ],
                  ), label: "المفضلة"),
                  BottomNavigationBarItem(icon: Column(
                    children: const [
                      Icon(FluentSystemIcons.ic_fluent_glance_regular,size: 25,),
                      SizedBox(height: 4,),
                    ],
                  ), label: "الشركات"),
                  BottomNavigationBarItem(icon: Column(
                    children: const [
                      Icon(CustomIcons.logo),
                      SizedBox(height: 4,),
                    ],
                  ), label: "عن التطبيق"),
                ],
              currentIndex: cubit.currentIndex,
              onTap: (index){
                  cubit.changeBottomNavIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
