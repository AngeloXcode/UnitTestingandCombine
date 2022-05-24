//
//  APIErrorTests.swift
//  Task1Tests
//
//  Created by Mac on 24/05/2022.
//

import XCTest

class APIErrorTests: XCTestCase {
    private var aPIError : APIError!
    override func setUp(){
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        aPIError = .invalidRequest
    }

    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_APIErrorEnum_associatedValuesInvalidRequest_ShoulReturnFullEquality() throws {
        let result = aPIError
        XCTAssertEqual(result, .invalidRequest)
        XCTAssertEqual(result?.errorDescription, "NetworkErrorRequest")
    }
    
    func test_APIErrorEnum_WhenChangetypeforJsonDecodingError_ShoulReturnTrue() throws {
        self.aPIError = .jsonDecodingError(error: "Test Error")
        XCTAssertEqual(aPIError, .jsonDecodingError(error: "Test Error"))
        XCTAssertEqual(aPIError?.errorDescription, "Test Error")
    }
    
    
    func test_APIErrorEnum_WhenChangetypefordataLoadingError_ShoulReturnTrue() throws {
        self.aPIError = .dataLoadingError(statusCode: 200)
        XCTAssertEqual(aPIError, .dataLoadingError(statusCode: 200))
        XCTAssertEqual(self.aPIError?.errorDescription, "Error :200")
    }
    
    func test_APIErrorEnum_WhenChangetypeforinvalidResponse_ShoulReturnTrue() throws {
        self.aPIError = .invalidResponse
        XCTAssertEqual(aPIError,.invalidResponse)
        XCTAssertEqual(self.aPIError?.errorDescription, "NetworkErrorResponse")
    }
    
    func test_APIErrorEnum_WhenChangetypeforUnreachable_ShoulReturnTrue() throws {
        self.aPIError = .unreachable
        XCTAssertEqual(aPIError,.unreachable)
        XCTAssertEqual(self.aPIError?.errorDescription, "unreachable")
    }
    
    
    
    
  
  
  



}
