//
//  AppDelegate.swift
//  iqro
//
//  Created by MyMacbook on 7/8/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarController:UITabBarController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupTabBarController()
        UIApplication.shared.statusBarStyle = .lightContent
        let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView
        statusBar?.backgroundColor = UIColor(hexString: "#ffffff")
        return true
    }
    
    func setupTabBarController() {
        tabBarController = UITabBarController()
        
        let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: ""))
        
        let donateStoryBoard = UIStoryboard(name: "Donate", bundle: nil)
        let donateViewController = donateStoryBoard.instantiateViewController(withIdentifier:"DonateViewController")
        let donateNavigationController = UINavigationController(rootViewController: donateViewController)
        donateNavigationController.tabBarItem = UITabBarItem(title: "Donate", image: UIImage(named: "ic_donate"), selectedImage: UIImage(named: ""))
        
        let updatesStoryBoard = UIStoryboard(name: "Updates", bundle: nil)
        let updatesViewController = updatesStoryBoard.instantiateViewController(withIdentifier: "UpdatesViewController")
        let updatesNavigationController = UINavigationController(rootViewController: updatesViewController)
        updatesNavigationController.tabBarItem = UITabBarItem(title: "Updates", image: UIImage(named: "ic_updates"), selectedImage: UIImage(named: ""))
        
        let bookingStoryBoard = UIStoryboard(name: "Booking", bundle: nil)
        let bookingViewController = bookingStoryBoard.instantiateViewController(withIdentifier: "BookingViewController")
        let bookingNavigationController = UINavigationController(rootViewController: bookingViewController)
        bookingNavigationController.tabBarItem = UITabBarItem(title: "Booking", image: UIImage(named: "ic_build"), selectedImage: UIImage(named: ""))
        
        UITabBar.appearance().barTintColor = UIColor(hexString: "#ffffff")
        UITabBar.appearance().tintColor = UIColor(hexString: "#01C770")
        
        let controllers = [homeNavigationController, donateNavigationController, updatesNavigationController, bookingNavigationController]
        tabBarController?.viewControllers = controllers
        window?.rootViewController = tabBarController
        
        // adjust tabbar item
        for tabBarItem in (tabBarController?.tabBar.items)! {
            tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: 4, right: 0)
            tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "iqro")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

