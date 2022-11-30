import 'package:e_wallet_mobile_apps/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile_apps/shared/shared_methods.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pin'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/profile-edit-success', (route) => false);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    title: 'Old PIN',
                    controller: oldPinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'New PIN',
                    controller: newPinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthUpdatePin(
                              oldPinController.text,
                              newPinController.text,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
