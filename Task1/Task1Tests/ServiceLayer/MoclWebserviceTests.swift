//
//  MoclWebserviceTests.swift
//  Task1Tests
//
//  Created by Mac on 24/05/2022.
//

import XCTest
import Combine

class MoclWebservice : WebServiceProtocal {
    
    func sendRequest<T>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> where T : Decodable {
        return Jus
    }
    
    
}

class MoclWebserviceTests: XCTestCase {
    
    override func setUp(){
        super.setUp()
    }

    override func tearDown(){
    }


}
