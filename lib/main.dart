import 'package:flutter/material.dart';

import 'movie/home_screen.dart';
import 'movie/splash.dart';
import 'my_theme.dart';

// import 'package:news/category/category_fragment.dart';
// import 'package:news/model/NewsResponse.dart';
// import 'package:news/news/news_article.dart';
// import 'package:news/providers/app_config_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'model/category.dart';

void main() {
  runApp(MyApp());
  // runApp(
  // ChangeNotifierProvider(
  // create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        // DetailsScreen.routeName: (context) => DetailsScreen(moviesList: null,),
        // NewsArticle.routeName: (context) => NewsArticle(news: News()),
      },
      theme: MyTheme.lightTheme,
    );
  }

// Future<void> initSharedPref() async {
//   final prefs = await SharedPreferences.getInstance();
//   var language = prefs.getString('language');
//   if (language != null) {
//     provider.changeLanguage(language);
//   }
// }
}
