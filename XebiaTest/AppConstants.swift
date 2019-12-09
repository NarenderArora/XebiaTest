//
//  AppConstants.swift
//  XebiaTest
//
//  Created by mojave on 09/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import Foundation
import UIKit

//Constant Networks
struct AppConstants {
    
    static let protocolo    : String = "https://"
    static let apiVersion   : String = "v2/viewed/"
    static let domain       : String = "api.nytimes.com/svc/mostpopular/"
    static let apiKey       : String = "TjT7iGwBxeMC6u94lBq2IvoWCrYimmGw"
    static let keyPath      : String = "api-key="
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain + AppConstants.apiVersion
    
    struct NewsTableView {
        static let heightForRow = 100.0
    }
     
}
