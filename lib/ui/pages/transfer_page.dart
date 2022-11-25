import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/forms.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/transfer_recent_user_item.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/transfer_resulrt_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
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
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by Username',
            isShowTitle: false,
          ),
          // buildRecentUsers()
          buildResultUsers(),
          const SizedBox(
            height: 240,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/transfer_amount',
              );
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friends1.png',
          name: 'Yonna Jie',
          username: 'yoenna',
          isVerified: true,
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friends4.png',
          name: 'John Hi',
          username: 'johnhi',
        ),
        const TransferRecentUserItem(
          imageUrl: 'assets/img_friends3.png',
          name: 'Masayoshi',
          username: 'form',
          isVerified: true,
        ),
      ],
    ),
  );
}

Widget buildResultUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Wrap(
          spacing: 2,
          runSpacing: 17,
          children: const [
            TransferResultUserItem(
              imageUrl: 'assets/img_friends1.png',
              name: 'Yonna Jie',
              username: 'yoenna',
              isVerified: true,
            ),
            TransferResultUserItem(
              imageUrl: 'assets/img_friends4.png',
              name: 'Yonne ke',
              username: 'yonneke',
              isVerified: true,
              isSelected: true,
            ),
          ],
        )
      ],
    ),
  );
}
