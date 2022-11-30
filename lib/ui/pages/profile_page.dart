import 'package:e_wallet_mobile_apps/shared/shared_methods.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, 'state.e');
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 22,
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage(
                                    'assets/img_profile.png',
                                  )
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_my_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit-pin');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_wallet_settings.png',
                        title: 'Wallet Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_reward.png',
                        title: 'My Rewards',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_help center.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/ic_log_out.png',
                        title: 'Log Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 57,
                ),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
