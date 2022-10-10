import 'package:e_wallet_mobile_apps/ui/pages/onbourding_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_in_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/on-boarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
      },
    );
  }
}
