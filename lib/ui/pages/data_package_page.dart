import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/forms.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/package_item.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/transfer_resulrt_user_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
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
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Wrap(
            spacing: 2,
            runSpacing: 17,
            children: const [
              PackageItem(
                amount: 10,
                price: 10000,
              ),
              PackageItem(
                amount: 50,
                price: 200000,
              ),
              PackageItem(
                amount: 100,
                price: 300000,
                isSelected: true,
              ),
              PackageItem(
                amount: 150,
                price: 500000,
              ),
            ],
          ),
         const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed:  () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data_success', (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
