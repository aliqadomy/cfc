import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  LocalAuth._internal();

  /// Authenticates the user using biometrics or device credentials
  static Future<bool> authenticate() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      return await auth.authenticate(
        localizedReason: 'Please authenticate using your device credentials',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == 'auth_in_progress') {
        print('Authentication is already in progress.');
        return false;
      } else if (e.code == 'user_canceled') {
        return false;


      } else if (e.code == 'not_enrolled') {
        return false;
      } else {

        return false;

      }

    } catch (e) {
      print('Unexpected error during authentication: $e');
      return false;
    }
  }

  /// Checks if the device supports biometric or device credentials
  static Future<bool> isDeviceSupported() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      return await auth.isDeviceSupported();
    } catch (e) {
      print('Device support check error: $e');
      return false;
    }
  }

  /// Fetches available biometric types supported by the device
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      return await auth.getAvailableBiometrics();
    } catch (e) {
      print('Error fetching available biometrics: $e');
      return [];
    }
  }
}
