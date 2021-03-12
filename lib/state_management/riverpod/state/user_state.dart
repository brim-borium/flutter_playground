import 'package:flutter_playground/state_management/riverpod/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState() = Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.loaded(User user) = UserData;
  const factory UserState.error({required String message}) = Error;
}
