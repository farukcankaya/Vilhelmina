//
//  IntroDataManager.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

protocol BootstrapDataManagerProtocol{
    var interactor: BootstrapInteractor? { get set }
}

class BootstrapDataManager: BootstrapDataManagerProtocol{
    var interactor: BootstrapInteractor?
}