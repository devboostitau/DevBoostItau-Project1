//
//  BaseViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

class BaseViewController: UIViewController {
    
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
        
    }
}
