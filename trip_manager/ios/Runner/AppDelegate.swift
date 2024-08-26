import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyB7W0mGdW4GxI4mwo4fSLeDQ6a6TYKxfVA")    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
