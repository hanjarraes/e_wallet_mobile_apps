import 'package:e_wallet_mobile_apps/blocs/user/user_bloc.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/pages/data_package_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/data_provider_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/data_success.dart';
import 'package:e_wallet_mobile_apps/ui/pages/home_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/onbourding_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/pin_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/profile_edit_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/profile_edit_pin_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/profile_edit_success_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/profile_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_in_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/sign_up_success.dart';
import 'package:e_wallet_mobile_apps/ui/pages/splash_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/topup_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/topup_success.dart';
import 'package:e_wallet_mobile_apps/ui/pages/transfer_amount.dart';
import 'package:e_wallet_mobile_apps/ui/pages/transfer_page.dart';
import 'package:e_wallet_mobile_apps/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_wallet_mobile_apps/blocs/auth/auth_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
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
            )),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/on-boarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileSuccessPage(),
          '/top-up': (context) => const TopUpPage(),
          '/top-up-success': (context) => const TopUpSuccessPage(),
          '/transfer_page': (context) => const TransferPage(),
          '/transfer_amount': (context) => const TransferAmountPage(),
          '/transfer_success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data_success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
