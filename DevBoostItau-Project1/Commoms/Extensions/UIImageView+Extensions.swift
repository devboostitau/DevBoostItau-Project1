//
//  UIImageView+Extensions.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

extension UIImageView {
    func tintImage(color: UIColor) {
        guard let image = image else {
            return
        }
        switch image.renderingMode {
        case .alwaysTemplate:
            break
        default:
            self.image = image.withRenderingMode(.alwaysTemplate)
        }
        tintColor = color
    }
}
