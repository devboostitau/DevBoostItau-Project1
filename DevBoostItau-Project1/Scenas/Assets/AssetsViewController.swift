//
//  AssetsViewController.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsViewController: UIViewController {

    // MARK: Properties
    private var balanceHidded = false
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var seeBalanceButton: UIButton!
    @IBOutlet weak var newInvestmentButton: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupView()
    }

    // MARK: Actions
    @IBAction func showBalance(_ sender: Any) {
        balanceHidded.toggle()
        balanceLabel.text = balanceHidded ? "--" : "R$ 3150,00"
    }
    
    // MARK: Mathods
    func setupView(){
        self.view.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        newInvestmentButton.applyGradient(style: .horizontal, colors: [UIColor.itiOrange, UIColor.itiPink])
        
        newInvestmentButton.clipsToBounds = true
        newInvestmentButton.layer.cornerRadius = 25
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 8
    }

    

}

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssetCell", for: indexPath) as? AssetTableViewCell else{
            return UITableViewCell()
        }

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: Pegar Asset clicado
        
        let viewController = AssetsDetailBuilder().builder(code: "MGLU3")
        present(viewController, animated: true, completion: nil)
    }
}
