import 'package:e_wallet_mobile_apps/blocs/user/user_bloc.dart';
import 'package:e_wallet_mobile_apps/models/user_model.dart';
import 'package:e_wallet_mobile_apps/shared/theme.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/buttons.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/forms.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/transfer_recent_user_item.dart';
import 'package:e_wallet_mobile_apps/ui/widgets/transfer_resulrt_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

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
          CustomFormField(
            title: 'by Username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecent());
              }
              setState(() {});
            },
          ),
          usernameController.text.isEmpty
              ? buildRecentUsers()
              : buildResultUsers(),
          const SizedBox(
            height: 240,
          ),
        ],
      ),
      floatingActionButton: selectedUser != null
          ? Container(
              margin: const EdgeInsets.all(22),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/transfer_amount',
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserSuccess) {
            return Column(
                children: state.users.map((user) {
              return TransferRecentUserItem(user: user);
            }).toList());
          }
          print(state);
          return const Center(
            child: CircularProgressIndicator(),
          );
        })
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
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            print(state);
            if (state is UserSuccess) {
              return Wrap(
                spacing: 2,
                runSpacing: 17,
                children: state.users.map((user) {
                  return GestureDetector(
                    child: TransferResultUserItem(user: user),
                  );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    ),
  );
}
