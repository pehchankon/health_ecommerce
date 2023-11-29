import 'package:alemeno_intern/blocs/shopping_cart.bloc.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/screens/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(kSystemUiOverlayStyle);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'title';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ShoppingCartCubit(),
      dispose: (context, cubit) => cubit.close(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: MyApp.title,
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
