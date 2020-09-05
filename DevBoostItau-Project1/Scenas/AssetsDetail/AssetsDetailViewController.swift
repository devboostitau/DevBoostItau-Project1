//
//  AssetsDetailViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsDetailBuilder {
    func builder(asset: Investment) -> AssetsDetailViewController {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
        viewController.asset = asset
        return viewController
    }
    
    // TODO: Remover, somente teste.
    func builder(code: String) -> AssetsDetailViewController {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
//        let asset = Investment()
//        viewController.asset = asset
        return viewController
    }
}

final class AssetsDetailViewController: BaseViewController {
    
    // MARK: Properties
    var viewModel: AssetsDetailViewModel!
    var asset: Investment? //TODO: Forçar
    var detail: AssetDetail?
    
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
        
        viewModel = AssetsDetailViewModel(asset: asset)
        
        setupView()
        bindEvents()
        viewModel.getAssetsWith(code: asset?.brokerCode ?? "ITSA4")
    }
    
    
    // MARK: Actions
    @IBAction func handlerCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlerButtonEdit(_ sender: Any) {
    }
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.onSuccess = { [weak self] in
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
        labelQuantity.text = viewModel.asset?.quantityOfStocks.description
        labelPricePurchase.text = viewModel.getPricePurchase()
        labelDatePurchase.text = viewModel.getDatePurchase()
        labelTotalValue.text = viewModel.getTotalValuePurchase()
        labelTodayQuote.text = viewModel.dateFormatter.string(from: Date())
        labelTotalToday.text = viewModel.getTotalValueToday()
        labelRentabilityPercent.text = viewModel.getRentability()
        
        var color = UIColor(red: 109/255, green: 173/255, blue: 51/255, alpha: 1)
        if viewModel.getRentabilityValue() < 0 {
            color = .red
        }
        
        labelRentabilityPercent.textColor = color
        labelTodayQuote.textColor = color
        labelTotalToday.textColor = color
    }
}
