//
//  AppDelegate.swift
//  MilosDimicProducerConsumer
//
//  Created by Dimic Milos on 4/28/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

/**
 Create a simple iOS-App which shows a table and two buttons below the table ordered horizontal.
 Clicking the left button creates a new producer.
 Clicking the right button creates a new consumer.
 
 A producer adds every 3 seconds a new cell in the table.
 A consumer removes every 4 seconds a cell from the table.
 A created producer/consumer will never be removed and will do its job forever.
 
 The user can create producer or consumer how often he wants by clicking the specified buttons.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

