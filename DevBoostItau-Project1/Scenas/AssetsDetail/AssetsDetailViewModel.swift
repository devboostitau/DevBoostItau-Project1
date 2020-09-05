//
//  AssetsDetailViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetsDetailViewModel {
    
    let repository: AssetDetailRepository!
    var asset: Investment?
    var detail: AssetDetail?
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }
    
    init(asset: Investment?, _ repository: AssetDetailRepository = AssetDetailRepository()) {
        self.asset = asset
        self.repository = repository
    }
    
    var onSuccess: (() -> Void)?
    var onFail: ((String) -> Void)?
    
    func getAssetsWith(code: String) {
        
        repository.getAsset(code: code, onSussecc: { [weak self] assetDetail in
            self?.detail = assetDetail
            self?.onSuccess?()
        }) { [weak self] error in
            self?.onFail?(error)
        }
    }
    
    func getPricePurchase() -> String {
        return formatter.string(from: NSNumber(value: asset?.purchasePrice ?? 0.0)) ?? "R$ 0,00"
    }
    
    func getDatePurchase() -> String {
        return "01/01/0001"
    }
    
    func getTotalValue() -> String {
        let quantityOfStocks = 10//asset.quantityOfStocks
        let purchasePrice = 15.50//asset.purchasePrice
        
        let totalValue = Double(quantityOfStocks) * purchasePrice
        
        return formatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
}
