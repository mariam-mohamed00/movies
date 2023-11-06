import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'movie/home_screen.dart';
import 'movie/splash.dart';
import 'my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();

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
