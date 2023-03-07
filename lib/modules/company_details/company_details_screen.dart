import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/cubit/states.dart';
import 'package:q8_store/shared/components/components.dart';
import 'package:q8_store/shared/styles/colors.dart';

class CompanyDetailsScreen extends StatefulWidget {
  final int index;
  const CompanyDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with TickerProviderStateMixin {
  late int index = widget.index;
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
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit cubit = BlocProvider.of(context);
        Size size = MediaQuery.of(context).size;
        return DefaultTabController(
          length: 6,
          child: Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    backgroundColor: myFavColor5,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(size.height *0.04),
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
                    expandedHeight: size.height <= 800 ? size.height * 0.7 : size.height * 0.45,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Center(
                              child: CircleAvatar(
                                radius: 48,
                                backgroundImage:
                                    AssetImage(cubit.companiesImages[index]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                cubit.companiesNames[index]
                                    .replaceAll(RegExp(r'\)|\('), ''),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "عن الشركة",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                "يعد اكسايت الغانم للالكترونيات أكبر موزع للالكترونيات في الكويت ويضم العديد من العلامات التجارية من بينها ما يفوق الـ٣٠٠ علامة تجارية عالمية. أما شركة صناعات الغانم التي يندرج تحتها اكسايت فهي واحدة من أكبر شركات القطاع الخاص في منطقةالخليج. وهي تمارس أنشطتها المتعددة في ٤٠ دولة وفي أكثر من ٣٠ مجال.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 12, color: myFavColor7),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "تابعنا علي",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 18),
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
                                      itemBuilder: (context, index) =>
                                          buildSocialIcons(
                                        context: context,
                                        index: index,
                                        iconsNames: cubit.socialIcons,
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 15,
                                      ),
                                      itemCount: cubit.socialIcons.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "المنتجات",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 18),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: size.width / (size.height / 1.4),
                            children: List.generate(
                              8,
                              (index) => buildAllHotOffersWithGrid(
                                size: size,
                                context: context,
                                productImages: cubit.productImages,
                                companiesImages: cubit.companiesImages,
                                companiesNames: cubit.companiesNames,
                                productName: cubit.productName,
                                productPrice: cubit.productPrice,
                                productOldPrice: cubit.productOldPrice,
                                index: this.index,
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
          ),
        );
      },
    );
  }
}
