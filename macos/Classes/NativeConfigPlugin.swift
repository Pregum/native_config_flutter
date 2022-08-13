import Cocoa
import FlutterMacOS

public class NativeConfigPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_config", binaryMessenger: registrar.messenger)
    let instance = NativeConfigPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "changeDisplayPriority":
        let args = call.arguments as! [String: Any]
        guard let displayPriority = args["display_priority"] as? Int else {
            result(FlutterError.init(code: "ArgumentError", message: "Required argument does not exist.", details: nil))
            return
        }
        
        guard let window = NSApp.windows.first else {
            result(false)
            return
        }
        
        window.level = displayPriority == 1 ? .floating : .normal
        result(true)
        
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
