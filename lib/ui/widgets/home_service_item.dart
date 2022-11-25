import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:flutter/material.dart';

class HoveServicesItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const HoveServicesItem(
      {Key? key, required this.iconUrl, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 26,
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
