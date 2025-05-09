import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  // Private constructor
  LocalAuth._internal();

  static final LocalAuthentication _auth = LocalAuthentication();

  /// Authenticates the user using biometrics
  static Future<bool> authenticate() async {
    try {
      // Check if device supports biometric authentication
      final bool canCheckBiometrics = await _auth.canCheckBiometrics;
      final bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        print('Biometric authentication is not supported or not enrolled.');
        return false;
      }

      final biometrics = await _auth.getAvailableBiometrics();
      print('Available biometrics: $biometrics');

      // Attempt authentication
      return await _auth.authenticate(
        localizedReason: 'Please authenticate using your device credentials',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print('PlatformException during authentication: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'auth_in_progress':
        case 'user_canceled':
        case 'not_enrolled':
        case 'locked_out':
        case 'permanently_locked_out':
          return false;
        default:
          return false;
      }
    } catch (e) {
      print('Unexpected error during authentication: $e');
      return false;
    }
  }

  /// Checks if the device supports any form of biometric or passcode
  static Future<bool> isDeviceSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  /// Returns a list of available biometric types
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }
}
