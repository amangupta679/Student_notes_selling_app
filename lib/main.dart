import 'package:day2/core/store.dart';
import 'package:day2/pages/cart_page.dart';
import 'package:day2/pages/home_detail_page.dart';
import 'package:day2/pages/login_page.dart';
import 'package:day2/pages/signup_page.dart';
import 'package:day2/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'widgets/themes.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vxNavigator = VxNavigator(routes: {
      "/": (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
      MyRoutes.homeDetailsRoute: (uri, _) {
        final catalog = (VxState.store as MyStore)
            .catalog
            .getById(int.parse(uri.queryParameters["id"]));
        return MaterialPage(
            child: HomeDetailPage(
          catalog: catalog,
        ));
      },
      MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
      MyRoutes.signupRoute: (_, __) => MaterialPage(child: SignUpPage()),
      MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
    });
    (VxState.store as MyStore).navigator = vxNavigator;

    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: vxNavigator,
      // initialRoute: MyRoutes.loginRoute,
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
      // },
    );
  }
}
