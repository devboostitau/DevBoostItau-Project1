//
//  BaseViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let loadingView: LoadingCustom = LoadingCustom.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoadingView()
    }
    
}

// MARK: LoadingView
extension BaseViewController {
    private func configureLoadingView() {
        loadingView.isHidden = true
        loadingView.frame = view.bounds
        view.addSubview(loadingView)
        loadingView.bringSubviewToFront(view)
    }
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func closeLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
}
