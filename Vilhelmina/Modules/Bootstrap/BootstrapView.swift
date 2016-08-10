//
//  ViewController.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import UIKit

protocol BootstrapViewProtocol{
    weak var presenter: BootstrapPresenter? { get set }
    
    func show(message message:String)
}

class BootstrapView: UIViewController, BootstrapViewProtocol{
    weak var presenter: BootstrapPresenter?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var currentActivityInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }
    
    func show(message message: String) {
        currentActivityInfoLabel.text = message
    }
}

