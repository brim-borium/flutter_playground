import 'package:flutter_playground/state_management/riverpod/state/user_state.dart';
import 'package:flutter_playground/state_management/riverpod/utils/user_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserClient _userClient;
  UserNotifier(this._userClient) : super(UserState());

  Future<void> getUserInfo(String userId) async {
    try {
      state = UserState.loading();
      final userInfo = await _userClient.fetchUserInfo(userId);
      state = UserState.loaded(userInfo!);
    } catch (e) {
      state = UserState.error(message: 'Error fetching user info, id: $userId');
    }
  }
}
