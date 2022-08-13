import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_config/native_config_method_channel.dart';

void main() {
  MethodChannelNativeConfig platform = MethodChannelNativeConfig();
  const MethodChannel channel = MethodChannel('native_config');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
