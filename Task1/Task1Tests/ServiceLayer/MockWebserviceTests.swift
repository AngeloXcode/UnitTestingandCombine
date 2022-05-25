//
//  MoclWebserviceTests.swift
//  Task1Tests
//
//  Created by Mac on 24/05/2022.
//

import XCTest
import Combine

class MockWebservice : WebServiceProtocal {
    
    func sendRequest<T>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError>{
        return Just(UserResponse(status: "1", message: "User Registration before") as! T)
            .setFailureType(to: APIError.self)
           .eraseToAnyPublisher()
    }
    
}

class MockWebserviceTests: XCTestCase {
    
    private var mockWebservice : MockWebservice!
    override func setUp(){
        super.setUp()
        mockWebservice = MockWebservice()
    }
    
    override func tearDown(){
    }

    func test_Mock(){
       _ = self.mockWebservice
            .sendRequest(Constants.createUer)
            .sink { error in
                   XCTAssertNotNil(error,"")
            } receiveValue: { data in
              XCTAssertNotNil(data,"")
             }

    }
    
    


}
