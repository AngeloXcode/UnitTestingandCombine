//
//  APIClient.swift
//  Task1
//
//  Created by Mac on 24/05/2022.
//

import Foundation
import Combine

final class APIClient : WebService{
    
    func createUser(username: String,password: String, email: String) -> AnyPublisher<UserResponse,APIError>{
        self.sendRequest(.createUser(username, password, email))
    }
}
