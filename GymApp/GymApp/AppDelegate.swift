//
//  AppDelegate.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 21/12/22.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let initialViewController = WelcomeScreenViewController()
        let navController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        FirebaseApp.configure()
        
        return true
        
    }
    
}

