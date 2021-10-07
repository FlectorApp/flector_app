// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

class DeviceSegment {
  static const mobile = 'mobile';
  static const web = 'web';

  static const DeviceSegment mobileDevice = DeviceSegment(mobile);
  static const DeviceSegment webDevice = DeviceSegment(web);

  final String name;
  const DeviceSegment(this.name);

  bool isWeb() {
    return name == web;
  }

  bool isMobile() {
    return name == mobile;
  }

  static DeviceSegment get currentDevice {
    if (kIsWeb) {
      return webDevice;
    }
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      return mobileDevice;
    }

    if (!kIsWeb &&
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
      // return desktop;
    }
    throw Exception('No Supported Environment selected');
  }
}
