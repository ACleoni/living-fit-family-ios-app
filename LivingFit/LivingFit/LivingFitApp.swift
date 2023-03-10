//
//  LivingFitApp.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/9/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}


@main
struct LivingFitApp: App {
    // Properties
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
      
    // Life Cycle
    init() {
        FirebaseApp.configure()
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    // UI Elements
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
