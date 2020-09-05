//
//  AddOrEditStockViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

struct Stock: Codable {
    var name: String?
    var quantity: String?
    var price: String?
    var startDate: String?
}

final class AddOrEditStockViewModel {
    var stock: Stock?
    
    func saveInfo() {
        print("INFORMACOES SALVAS")
    }
}
