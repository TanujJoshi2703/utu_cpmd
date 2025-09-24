
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<AsyncValue<void>> {
  AuthenticationController() : super(const AsyncValue.data(null));

  Future<void> loginWithOTP(String phone) async {
    state = const AsyncValue.loading();
    try {
      // TODO: Implement Firebase OTP login
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> verifyOTP(String code) async {
    state = const AsyncValue.loading();
    try {
      // TODO: Implement Firebase OTP verification
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      // TODO: Implement Firebase email login
      await Future.delayed(const Duration(seconds: 2)); // Simulate network request
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      // TODO: Implement Firebase logout
      await Future.delayed(const Duration(seconds: 1)); // Simulate network request
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthenticationController, AsyncValue<void>>((ref) {
  return AuthenticationController();
});
