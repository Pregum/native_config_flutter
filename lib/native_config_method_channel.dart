import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'display_type.dart';
import 'native_config_platform_interface.dart';

/// An implementation of [NativeConfigPlatform] that uses method channels.
class MethodChannelNativeConfig extends NativeConfigPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_config');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> changeDisplayPriority(DisplayType displayPriority) async {
    final result = await methodChannel.invokeMethod<bool>(
        'changeDisplayPriority',
        <String, Object>{'display_priority': displayPriority.displayType});
    return result;
  }
}
