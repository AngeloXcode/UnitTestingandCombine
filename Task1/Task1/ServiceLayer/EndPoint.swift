//
//  EndPoint.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation
import UIKit

protocol RequestParamter {
    var endPoint : Endpoint { get }
    var model    : [String: String] { get set }
    var headers  : [String: String]? { get set }
}

enum HTTPMethod : String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
}

enum Endpoint : String {
    private var baseURL: String { return "http://localhost:8888/Healty_Box_server_v1/webservices/api/" }
    
    case createUser = "/CreateAppUser.php"
    case loginUser  = "/LoginUser.php"
    
    
    private var fullPath: String {
        return baseURL + self.rawValue
    }
    
    var method : HTTPMethod {
        switch self{
        case .createUser,.loginUser:
            return .post
        }
    }
    
    var url: URL {
        return URL(string: fullPath)!
    }
    
}

class UrlRequst {
    
    private var request : RequestParamter!
    init(request : RequestParamter){
        self.request = request
    }
    
    func asURLRequest() -> URLRequest {
        print(request.endPoint.url)
        print(request.endPoint.method)
        var urlRequest = URLRequest(url: request.endPoint.url)
        urlRequest.httpMethod = "\(request.endPoint.method)"
        if let headers = request.headers{
            urlRequest.allHTTPHeaderFields = headers
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: request.model, options: .prettyPrinted)
        return urlRequest
    }
}
