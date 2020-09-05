//
//  AssetsViewController.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsViewController: BaseViewController {

    // MARK: Properties
    private var balanceHidded = false
    var investments: [Investment] = []
    
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
        setupMockData() //TODO: remove me
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
    
    func setupMockData() {
        
    }
}

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//investments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssetCell", for: indexPath) as? AssetTableViewCell else{
            return UITableViewCell()
        }

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "editar", handler: { (action, indexPath) in
            
        })
        editAction.backgroundColor = UIColor.lightGray
        
        let deleteAction = UITableViewRowAction(style: .default, title: "excluir", handler: { (action, indexPath) in
            
        })
        
        return [editAction, deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let asset = self.investments[indexPath.row]
//        guard let _ = asset.brokerCode else {return}
        
//        let viewController = AssetsDetailBuilder().builder(asset: asset)
        let viewController = AssetsDetailBuilder().builder(code: "ITSA4")
        present(viewController, animated: true, completion: nil)
    }
}
