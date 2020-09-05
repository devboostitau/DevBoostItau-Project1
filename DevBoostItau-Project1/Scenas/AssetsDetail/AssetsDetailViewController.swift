//
//  AssetsDetailViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsDetailBuilder {
    func builder() -> AssetsDetailViewController {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
        
        return viewController
    }
}

final class AssetsDetailViewController: BaseViewController {
    
    // MARK: Properties
    let viewModel = AssetsDetailViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var labelAssetName: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelPricePurchase: UILabel!
    @IBOutlet weak var labelDatePurchase: UILabel!
    @IBOutlet weak var labelTotalValue: UILabel!
    @IBOutlet weak var labelTodayQuote: UILabel!
    @IBOutlet weak var labelTotalToday: UILabel!
    @IBOutlet weak var labelRentabilityPercent: UILabel!
    @IBOutlet weak var imgIconClose: UIImageView!
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgIconClose.tintImage(color: .gray)
    }
    
    
    // MARK: Actions
    @IBAction func handlerCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlerButtonEdit(_ sender: Any) {
    }
    
    // MARK: Methods
}
