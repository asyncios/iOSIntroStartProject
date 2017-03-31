//
//  CoreDataApi.swift
//  NewApp
//
//  Created by josue cadillo on 3/31/17.
//  Copyright © 2017 FandangoLatam. All rights reserved.
//

import UIKit
import CoreData

class CoreDataApi: NSObject {
    
    private static let DEFAULT_ERROR = "Ocurrio un Error"
    
    var appDelegate: AppDelegate?
    var entityString = ""
    var firstTime = false
    
    required override init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        self.appDelegate = appDelegate
    }
    
    func setEnitity(entityString: String) {
        self.entityString = entityString
    }
    
    func execute(start: @escaping ()->Void,
                 completed: @escaping ([NSManagedObject])->Void,
                 error: @escaping (String)->Void) {
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityString)
        do {
            if let array = try managedContext?.fetch(fetchRequest)
            {
                completed(array)
                return
            }
            error(CoreDataApi.DEFAULT_ERROR)
        } catch let errorCatch as NSError {
            print("Could not fetch. \(errorCatch), \(errorCatch.userInfo)")
            error(CoreDataApi.DEFAULT_ERROR)
        }
    }
    
    
    func save(key: String,value:String) {
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: entityString,
                                                in: (managedContext)!)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(value, forKeyPath: key)
        
        do {
            try managedContext?.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
