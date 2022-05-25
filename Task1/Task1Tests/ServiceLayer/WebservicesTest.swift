//
//  WebservicesTest.swift
//  Task1Tests
//
//  Created by Mac on 23/05/2022.
//

import XCTest
import Combine


class WebServicesTest: XCTestCase {
    
    private var webservices   : WebService!
    private var cancellables = Set<AnyCancellable>()
    private var userResponse : UserResponse!
    
    override func setUp() {
        super.setUp()
        self.webservices = WebService()
    }
    
    override func tearDown(){
        super.setUp()
    }
    
    func test_WebService_CheckIfServerviceHaveRequest_ShouldReturnTrue(){
        let expectation  = XCTestExpectation(description: "Test User Register")
        self.webservices.sendRequest(Constants.createUer).sink { (completion) in
            switch completion {
            case .failure(_):
                XCTFail()
                break
            case .finished:
                break
            }
        } receiveValue: { (result : UserResponse) in
            if let userResponse = result as UserResponse?{
                self.userResponse = userResponse
                print(userResponse)
                expectation.fulfill()
            }
        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(self.userResponse.message,"The message isn't Nil")
//        XCTAssertNotNil(self.userResponse.status,"The status isn't Nil")
        
    }
    
    
}
