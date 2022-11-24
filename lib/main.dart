import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/pages/home_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/onbourding_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/profile_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_in_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_set_ktp.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_set_profile.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_success.dart';
import 'package:e_wallet_mobile_apps/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          centerTitle: true,
          titleTextStyle: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/on-boarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
