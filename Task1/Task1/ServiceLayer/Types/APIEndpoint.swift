//
//  APIEndpoint.swift
//  Task1
//
//  Created by Mac on 24/05/2022.
//

import Foundation
import UIKit

enum APIEndpoint{
    
    // MARK: - Cases
    case createUser
    case loginUser
    
    // MARK: - Properties
    
    private var fullPath: URL {
        return Environment.apiBaseURL.appendingPathComponent(self.path)
    }
    
    var request : URLRequest{
        var request = URLRequest(url: fullPath)
        request.addHeaders(headers)
        request.httpMethod = httpMethods.rawValue
        return request
    }
    
    private var path : String {
        switch self{
        case .createUser:
            return "/CreateAppUser.php"
        case .loginUser:
            return  "/LoginUser.php"
        }
    }
    
    private var headers : Headers {
        [
            "Content-Type" : "application/json"
        ]
    }
    
    private var httpMethods : HTTPMethod {
        switch self{
        case .createUser,.loginUser:
            return .post
        }
    }

}

fileprivate extension URLRequest{
    
    mutating func addHeaders(_ headers : Headers){
        headers.forEach{ header,value in
           addValue(header, forHTTPHeaderField: value)
        }
    }
}
