//
//  NetworkingClient.swift
//  
//
//  Created by HaroldDavidson on 9/24/19.
//

import Foundation
import Alamofire

class NetworkingClient {
    func execute(_ url: URL) {
        Alamofire.request(url).validate().responseJSON {
            response in 
        }
    }
}
