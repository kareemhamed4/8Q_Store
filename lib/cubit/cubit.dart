import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  MainCubit get(context) => BlocProvider.of(context);

  List<String> productImages = [
    "assets/images/earpods.png",
    "assets/images/gold_iphone.png",
    "assets/images/laptop.png",
    "assets/images/iphone.png",
    "assets/images/ipad.png",
    "assets/images/black_iphone.png",
    "assets/images/red_iphone.png",
    "assets/images/gold_iphone.png",
  ];

  List<String> companiesImages = [
    "assets/images/4ustore.png",
    "assets/images/oredo.png",
    "assets/images/xcite.png",
    "assets/images/zain.jpg",
    "assets/images/EurekaKuwait.png",
    "assets/images/BestAlYousif.jpg",
    "assets/images/xcite.png",
    "assets/images/BestAlYousif.jpg",
  ];

  List<String> companiesNames = [
    "(فوريوستور)",
    "(اوريدو)",
    "(اكسايت)",
    "(زين)",
    "(يوريكا)",
    "(بيست)",
    "(بيست)",
    "(بيست)",
  ];

  List<String> productName = [
    "Samsung Galaxy Buds2 Pro Bluetooth Earbuds",
    "Apple iPhone 14 Pro (256 GB) - Gold",
    "Lenovo IdeaPad Gaming 3 15.6\" 120Hz Gaming Laptop AMD",
    "Apple iPhone 14 Pro (256 GB) - Deep Purple",
    "Apple iPad Pro (256 GB) - Silver",
    "Apple iPhone 14 Pro (256 GB) - Black",
    "Apple iPhone 14 Pro (256 GB) - Red",
    "Apple iPhone 14 Pro (256 GB) - Gold",
  ];

  List<String> productPrice = [
    "120 دينار",
    "888 دينار",
    "222 دينار",
    "666 دينار",
    "777 دينار",
    "666 دينار",
    "600 دينار",
    "888 دينار",
  ];
  List<String> productOldPrice = [
    "200 دينار",
    "1200 دينار",
    "599 دينار",
    "999 دينار",
    "1100 دينار",
    "800 دينار",
    "700 دينار",
    "1200 دينار",
  ];

  List<String> socialIcons = [
    "assets/icons/pinterest.svg",
    "assets/icons/whatsapp.svg",
    "assets/icons/twitter.svg",
    "assets/icons/instagram.svg",
    "assets/icons/facebook.svg",
  ];

  bool isTextExpanded = true ;
  IconData textExpandedIcon = Icons.keyboard_arrow_up_rounded;


  void changeExpandedText(){
    isTextExpanded = !isTextExpanded;
    textExpandedIcon = isTextExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded;
    emit(ChangeExpandedTextState());
  }
}