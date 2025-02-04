import 'package:flutter_demo_mock_app/models/login/login_page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uncertified_state.freezed.dart';

@freezed
class UncertifiedState extends LoginPageState with _$UncertifiedState {
  factory UncertifiedState({
    @Default('') String mailAddress,
    @Default('') String password,
  }) = _UncertifiedState;
}
