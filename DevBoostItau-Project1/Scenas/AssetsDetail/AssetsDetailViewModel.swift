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
    
    init(_ repository: AssetDetailRepository = AssetDetailRepository()) {
        self.repository = repository
    }
    
    var onSuccess: ((AssetDetail) -> Void)?
    var onFail: ((String) -> Void)?
    
    func getAssetsWith(code: String) {
        
        repository.getAsset(code: code, onSussecc: { [weak self] assetDetail in
            self?.onSuccess?(assetDetail)
        }) { [weak self] error in
            self?.onFail?(error)
        }
    }
    
}
