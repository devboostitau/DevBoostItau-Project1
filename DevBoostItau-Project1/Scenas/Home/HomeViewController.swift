//
//  HomeViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: Properties
    let viewModel = HomeViewModel()
    
    // MARK: Outlets
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: Actions
    @IBAction func handlerButton1(_ sender: Any) {
        
    }
    
    @IBAction func handlerButton2(_ sender: Any) {
    }
    
    @IBAction func handlerButton3(_ sender: Any) {
        self.navigationController?.present(AddOrEditStockViewController(), animated: true, completion: nil)
    }
    
    @IBAction func handlerButton4(_ sender: Any) {
    }
    
    
    // MARK: Mathods
    
}
