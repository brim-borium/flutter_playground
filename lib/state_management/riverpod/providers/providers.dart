import 'package:flutter_playground/state_management/riverpod/notifier/user_notifier.dart';
import 'package:flutter_playground/state_management/riverpod/utils/user_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userClientProvider = Provider<UserClient>((ref) => UserClient());
final userNotifierProvider =
    StateNotifierProvider((ref) => UserNotifier(ref.watch(userClientProvider)));
