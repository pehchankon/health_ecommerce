import 'package:alemeno_intern/blocs/shopping_cart.cubit.dart';
import 'package:alemeno_intern/constants.dart';
import 'package:alemeno_intern/data/api_client.dart';
import 'package:alemeno_intern/data/data_repository.dart';
import 'package:alemeno_intern/screens/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(kSystemUiOverlayStyle);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'title';
  final apiClient = ApiClient('mockBaseURL');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ShoppingCartCubit(),
          dispose: (context, cubit) => cubit.close(),
        ),
        RepositoryProvider(
          create: (context) => DataRepository(apiClient),
        ),
      ],
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
