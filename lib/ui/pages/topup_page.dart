import 'package:e_wallet_mobile_apps/blocs/auth/auth_bloc.dart';
import 'package:e_wallet_mobile_apps/blocs/payment_method/payment_method_bloc.dart';
import 'package:e_wallet_mobile_apps/models/payment_method_model.dart';
import 'package:e_wallet_mobile_apps/models/topup_form_model.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/pages/topup_amount_page.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/bank_item.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Image.asset(
                    'assets/img_wallet.png',
                    width: 80,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.cardNumber!.replaceAllMapped(
                            RegExp(r".{4}"), (match) => "${match.group(0)} "),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            return Container();
          }),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                builder: (context, state) {
              if (state is PaymentMethodSuccess) {
                return Column(
                  children: state.paymentMethods.map((paymentMethod) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPaymentMethod = paymentMethod;
                        });
                      },
                      child: BankItem(
                        paymentMethod: paymentMethod,
                        isSelected:
                            paymentMethod.id == selectedPaymentMethod?.id,
                      ),
                    );
                  }).toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: selectedPaymentMethod != null
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopUpAmountPage(
                        data: TopUpFormModel(
                          paymentMethodCode: selectedPaymentMethod?.code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
