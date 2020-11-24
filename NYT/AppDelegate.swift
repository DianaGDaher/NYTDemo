//
//  AppDelegate.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return coreapp.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    func applicationWillResignActive(_ application: UIApplication) {
        coreapp.applicationWillResignActive(application)
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        coreapp.applicationDidEnterBackground(application)
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        coreapp.applicationWillEnterForeground(application)
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        coreapp.applicationDidBecomeActive(application)
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return coreapp.application(app, open: url, options: options)
    }
    
}

