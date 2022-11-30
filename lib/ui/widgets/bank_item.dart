import 'package:e_wallet_mobile_apps/models/payment_method_model.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {

  final PaymentMethodModel paymentMethod;
  final bool isSelected;

  const BankItem({
    Key? key,
    required this.paymentMethod,
    this.isSelected = false,
    // this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image.network(
          //   paymentMethod.thumbnail.toString(),
          //   height: 30,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 min',
                style: grayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
