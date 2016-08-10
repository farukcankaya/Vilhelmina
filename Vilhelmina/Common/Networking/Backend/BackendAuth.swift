//
//  BackendAuth.swift
//  Vilhelmina
//
//  Created by Muhammed Said Özcan on 10/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public final class BackendAuth{
    var token: String?
    public static var shared: BackendAuth = BackendAuth()
}