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
    
    private let loadingView: LoadingCustom = LoadingCustom.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoadingView()
    }

    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
}

// MARK: LoadingView
extension BaseViewController {
    private func configureLoadingView() {
        loadingView.isHidden = true
        loadingView.frame = view.bounds
        view.addSubview(loadingView)
        loadingView.bringSubviewToFront(view)
    }
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func closeLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
}
