import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'display_type.dart';
import 'native_config_method_channel.dart';

abstract class NativeConfigPlatform extends PlatformInterface {
  /// Constructs a NativeConfigPlatform.
  NativeConfigPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeConfigPlatform _instance = MethodChannelNativeConfig();

  /// The default instance of [NativeConfigPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeConfig].
  static NativeConfigPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeConfigPlatform] when
  /// they register themselves.
  static set instance(NativeConfigPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> changeDisplayPriority(DisplayType displayPriority) {
    throw UnimplementedError(
        'changeDisplayPriority() has not been implemented.');
  }
}
