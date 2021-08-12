//
//  AuthTesterApp.swift
//  AuthTester
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI
import Firebase

@available(iOS 15.0, *)
@main
struct AuthTesterApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
      let signInViewModel = SignInViewModel()
        WindowGroup {
            ContentView()
            .environmentObject(signInViewModel)
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//    FirebaseApp.configure()
//    return true
//
//  }

//}
