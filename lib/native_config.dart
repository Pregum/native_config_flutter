import 'display_type.dart';
import 'native_config_platform_interface.dart';

class NativeConfig {
  Future<String?> getPlatformVersion() {
    return NativeConfigPlatform.instance.getPlatformVersion();
  }

  Future<bool?> changeDisplayPriority(DisplayType displayPriority) {
    return NativeConfigPlatform.instance.changeDisplayPriority(displayPriority);
  }
}
