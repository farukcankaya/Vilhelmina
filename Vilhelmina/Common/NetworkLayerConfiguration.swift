//
//  NetworkLayerConfiguration.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation


class NetworkLayerConfiguration{
    class func setup(){
        
        // Backend Configuration
        
        let conf = BackendConfiguration(baseURL: "api.com", basePath: "mobile", apiVersion: "v3")
        BackendConfiguration.shared = conf
        
        // Network Queue
        NetworkQueue.shared = NetworkQueue()
    }
}