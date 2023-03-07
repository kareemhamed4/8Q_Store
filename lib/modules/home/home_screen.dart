import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/custom_icons_icons.dart';
import 'package:q8_store/modules/black_friday/black_friday_screen.dart';
import 'package:q8_store/modules/hot_offers/hot_offers_screen.dart';
import 'package:q8_store/shared/styles/colors.dart';
import 'package:q8_store/shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state){
        MainCubit cubit = BlocProvider.of(context);
        return DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Icon(
                CustomIcons.logo,
                color: myFavColor,
                size: 30,
              ),
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor: myFavColor5,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(size.height * 0.04),
                    child: SizedBox(
                      height: size.height * 60 / 812,
                      width: double.infinity,
                      child: AppBar(
                        bottom: defaultTabBar(
                          context: context,
                          tabController: _tabController,
                        ),
                      ),
                    ),
                  ),
                  expandedHeight: size.height * 0.3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 44,
                                  child: TextFormField(
                                    cursorColor: myFavColor,
                                    cursorHeight: 20,
                                    style: Theme.of(context).textTheme.bodyText1,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        FluentSystemIcons.ic_fluent_search_regular,
                                        color: myFavColor.withOpacity(0.30),
                                      ),
                                      hintText: "بحث",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: myFavColor.withOpacity(0.30)),
                                      fillColor: myFavColor3,
                                      filled: true,
                                      isDense: false,
                                      border: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: (){
                                  print(size.height);
                                },
                                child: Container(
                                  width: 42,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: myFavColor3,
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    color: myFavColor.withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: (){
                              NavigateTo(context: context, widget: const BlackFridayScreen());
                            },
                            child: buildBlackFridayBanner(
                              context: context,
                              size: size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: size.width / (size.height / 1.4),
                          children: List.generate(
                            2,
                                (index) =>
                                buildGridProduct(
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
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "عروض مميزة",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                              onPressed: (){
                                NavigateTo(context: context, widget: const HotOffersScreen());
                              },
                              child: Text(
                                "عرض الكل",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: myFavColor6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.15,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) => buildHotOffers(
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
                              width: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
