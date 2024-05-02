import 'package:covid_app/data/providers/data_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@Riverpod(keepAlive: true)
class LoginController extends _$LoginController {
  @override
  Future<bool?> build() async {
    return null;
  }

  Future<bool?> login({
    required String username,
    required String password,
  }) async {
    bool? result;
    state = const AsyncLoading();
    try {
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      var auth = await ref.read(authRepositoryProvider).login(
            username: username,
            password: password,
          );

      state = AsyncData(auth);
      result = auth;
    } catch (error, stack) {
      state = AsyncError(error, stack);
      result = null;
    }
    return result;
  }

  void logout() {
    state = const AsyncData(false);
  }
}
