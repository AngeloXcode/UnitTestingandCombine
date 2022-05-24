//
//  APIEndpointTests.swift
//  Task1Tests
//
//  Created by Mac on 24/05/2022.
//

import XCTest

class APIEndpointTests: XCTestCase {
    
    private var apiEndPoint : APIEndpoint!
    override func setUp(){
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        apiEndPoint = .createUser
    }
    
    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_APIEndpoint_SpecifyEndPointName_ShouldFullEqually() {
        let request : APIEndpoint =  .createUser
        XCTAssertEqual(apiEndPoint,request)
    }
    
    func test_APIEndpoint_SpecifyEndPointFullPath_ShouldFullEqually() {
        var request : APIEndpoint =  .createUser
        XCTAssertEqual(apiEndPoint.returnValueFullPath(),request.returnValueFullPath())
    }
    
    
    func test_APIEndpoint_SpecifyEndPointRequest_ShouldFullEqually() {
        let request : APIEndpoint = .createUser
        XCTAssertEqual(apiEndPoint.request,request.request)
    }
    
    
    func test_APIEndpoint_SpecifyEndPointHttpMethod_ShouldFullEqually() {
        var request : APIEndpoint = .createUser
        XCTAssertEqual(apiEndPoint.returnHttpMethodsValue(),request.returnHttpMethodsValue())
    }
    
    
    
}
