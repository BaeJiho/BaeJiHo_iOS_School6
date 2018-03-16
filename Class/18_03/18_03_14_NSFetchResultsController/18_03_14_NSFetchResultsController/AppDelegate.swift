//
//  AppDelegate.swift
//  18_03_14_NSFetchResultsController
//
//  Created by 배지호 on 2018. 3. 14..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack(modelName: "_8_03_14_NSFetchResultsController")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        guard let naviVC = window?.rootViewController as? UINavigationController,
        let viewController = naviVC.topViewController as? ViewController
        else { return true }
        
        viewController.coreDataStack = coreDataStack
        importJSONSeedDataIfNeeded()
        return true
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
        
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "_8_03_14_NSFetchResultsController")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate {
    
    func importJSONSeedDataIfNeeded() {
        
        let fetchRequest: NSFetchRequest<Team> = Team.fetchRequest()
        let count = try? coreDataStack.managedContext.count(for: fetchRequest)
        
        guard let teamCount = count, teamCount == 0 else { return }
        importJSONSeedData()
    }
    
    func importJSONSeedData() {
        let jsonURL = Bundle.main.url(forResource: "seed", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: jsonURL)
        
        do {
            let josonArray = try JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments]) as! [[String:Any]]
            
            for jsonDic in josonArray {
                let teamName = jsonDic["teamName"] as! String
                let zone = jsonDic["qualifyingZone"] as! String
                let imgName = jsonDic["imageName"] as! String
                let win = jsonDic["wins"] as! NSNumber
                
                let team = Team(context: coreDataStack.managedContext)
                
                team.teamName = teamName
                team.qualiftingZone = zone
                team.imageName = imgName
                team.wins = win.int32Value
            }
            
            
        } catch let error as NSError {
            print("error \(error)")
        }
    }
}

