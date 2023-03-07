import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:q8_store/app_localization.dart';
import 'package:q8_store/cubit/cubit.dart';
import 'package:q8_store/layout/cubit/cubit.dart';
import 'package:q8_store/modules/on_boarding/on_boarding_screen.dart';
import 'package:q8_store/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(create: (BuildContext context) => MainCubit()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale("ar"),
          supportedLocales: const [Locale("ar"), Locale('en')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          title: '8Q Store',
          theme: lightTheme,
          themeMode: ThemeMode.light,
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
