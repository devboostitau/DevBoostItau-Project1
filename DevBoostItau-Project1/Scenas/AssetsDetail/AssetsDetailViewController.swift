//
//  AssetsDetailViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsDetailBuilder {
    func builder(code: String) -> AssetsDetailViewController {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
        viewController.code = code
        return viewController
    }
}

final class AssetsDetailViewController: BaseViewController {
    
    // MARK: Properties
    let viewModel = AssetsDetailViewModel()
    var detail: AssetDetail?
    var code: String!
    
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
        
        setupView()
        bindEvents()
        viewModel.getAssetsWith(code: code)
    }
    
    
    // MARK: Actions
    @IBAction func handlerCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlerButtonEdit(_ sender: Any) {
    }
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.onSuccess = { [weak self] assetDetail in
            self?.detail = assetDetail
            DispatchQueue.main.async {
                self?.setupView()
            }
        }
        
        viewModel.onFail = { error in
            print("==> Error: \(error)")
        }
    }
    
    private func setupView() {
        imgIconClose.tintImage(color: .gray)
        
        labelAssetName.text = detail?.getName
        labelQuantity.text = "100"
        labelPricePurchase.text = detail?.getPrice
        labelDatePurchase.text = "10/01/1988"
        labelTotalValue.text = detail?.getPrice
    }
}

/*

 "MGLU3": {
     "symbol": "MGLU3",
     "name": "Magazine Luiza S.A.",
     "region": "Brazil/Sao Paolo",
     "currency": "BRL",
     "market_time": {
         "open": "10:00",
         "close": "17:30",
         "timezone": -3
     },
     "market_cap": 144227,
     "price": 88.77,
     "change_percent": 0.31,
     "updated_at": "2020-09-04 20:47:57"
 }
 */
