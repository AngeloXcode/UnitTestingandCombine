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
    case createUser(_ username:String,_ password:String,_ email:String)
    case loginUser
    
    // MARK: - Properties
    
    private var fullPath: URL {
        return Environment.apiBaseURL.appendingPathComponent(self.path)
    }
    
    var request : URLRequest{
        var request = URLRequest(url: fullPath)
        request.addHeaders(headers)
        request.httpMethod = httpMethods.rawValue
        if !bodyHeaders.isEmpty{
            request.httpBody = try? JSONEncoder().encode(bodyHeaders)
        }
        return request
    }
    
    private var path : String {
        switch self{
        case .loginUser:
            return  "/LoginUser.php"
        case .createUser(_, _, _):
            return "/CreateAppUser.php"
        }
    }
    
    private var headers : Headers {
        [
            "Content-Type" : "application/json"
        ]
    }


    private var httpMethods : HTTPMethod {
        switch self{
        case .createUser(_, _, _),.loginUser:
            return .post
        }
    }
    
    mutating func returnValueFullPath() -> URL{
        return fullPath
    }
    
    mutating func returnHttpMethodsValue() -> HTTPMethod{
        return httpMethods
    }
    
}


extension APIEndpoint{
    private var bodyHeaders : Headers {
        switch self{
        case .createUser(let username, let pass, let email):
            return ["user_name": username,
                    "user_email": pass ,
                    "user_password" : email]
        case .loginUser:
            return ["Token":"123456"]
        }
    }
    
    mutating func returnBodyHeadersValue() -> Headers{
        return bodyHeaders
    }
}
extension APIEndpoint : Equatable {
    static func == (lhs: APIEndpoint, rhs: APIEndpoint) -> Bool {
        return lhs.fullPath == rhs.fullPath
    }
}


fileprivate extension URLRequest{
    
    mutating func addHeaders(_ headers : Headers){
        headers.forEach{ header,value in
            addValue(header, forHTTPHeaderField: value)
        }
    }
}
