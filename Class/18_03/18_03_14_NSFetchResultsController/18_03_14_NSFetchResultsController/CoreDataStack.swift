//
//  CoreDataStack.swift
//  18_03_14_NSFetchResultsController
//
//  Created by 배지호 on 2018. 3. 14..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores{ (storeDesription, error) in
            if let error = error as NSError? {
                print("Error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("error \(error), \(error.userInfo)")
        }
    }
}
