//
//  Environment.swift
//  Task1
//
//  Created by Mac on 24/05/2022.
//

import Foundation
import UIKit

class Environment{
    public static var apiBaseURL : URL {
        return URL(string: "http://localhost:8888/Healty_Box_server_v1/webservices/api/")!
    }
}
