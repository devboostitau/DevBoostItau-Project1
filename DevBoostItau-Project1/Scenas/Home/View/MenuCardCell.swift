//
//  MenuCardCell.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class MenuCardCell: UICollectionViewCell {
    
    static let identifier = "MenuCardCell"
    
    // MARK: - Outlets
    @IBOutlet weak var gradientBackground: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientBackground.layer.cornerRadius = 8
    }
    
    // MARK: - Methods
    func setupView(cardMenu: CardMenu) {
        titleLabel.text = cardMenu.title
        subtitleLabel.text = cardMenu.subtitle
    }
}
