//
//  AppDelegate.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 05/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var mainRouter: MainRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let view = UIViewController()
        view.view.backgroundColor = .red
        mainRouter = MainRouter()
        mainRouter?.start(with: view)
        return true
    }
}

