import 'package:flutter/material.dart';
import 'package:flutter_demo_mock_app/models/login/uncertified_state.dart';
import 'package:flutter_demo_mock_app/states/login/usecase/uncertified_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UncertifiedContents extends ConsumerWidget {
  const UncertifiedContents({
    super.key,
    required this.state,
    required this.notifier,
  });

  final UncertifiedState state;
  final UncertifiedCase notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          onChanged: notifier.onChangeMailAdress,
        ),
        TextField(
          obscureText: true,
          onChanged: notifier.onChangePassword,
        ),
        ElevatedButton(
          onPressed: notifier.onClickLoginButton,
          child: Text('login'),
        )
      ],
    );
  }
}
