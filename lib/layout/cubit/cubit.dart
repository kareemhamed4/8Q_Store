import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/layout/cubit/states.dart';
import 'package:q8_store/modules/about_app/about_app_screen.dart';
import 'package:q8_store/modules/companies/companies_screen.dart';
import 'package:q8_store/modules/favourite/favourite_screen.dart';
import 'package:q8_store/modules/home/home_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNavIndex (index){
    currentIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const CompaniesScreen(),
    const AboutAppScreen(),
  ];
}