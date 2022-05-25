//
//  APIEndpointTests.swift
//  Task1Tests
//
//  Created by Mac on 24/05/2022.
//

import XCTest

class APIEndpointTests: XCTestCase {
    
    private var apiEndPoint : APIEndpoint! = Constants.createUer
    override func setUp(){
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }
    
    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_APIEndpoint_SpecifyEndPointName_ShouldFullEqually() {
        let request : APIEndpoint = Constants.createUer
        XCTAssertEqual(apiEndPoint,request)
    }
    
    func test_APIEndpoint_SpecifyEndPointFullPath_ShouldFullEqually() {
        var request : APIEndpoint =  Constants.createUer
        XCTAssertEqual(apiEndPoint.returnValueFullPath(),request.returnValueFullPath())
    }
    
    
    func test_APIEndpoint_SpecifyEndPointRequest_ShouldFullEqually() {
        let request : APIEndpoint = Constants.createUer
        XCTAssertEqual(apiEndPoint.request,request.request)
    }
    
    
    func test_APIEndpoint_SpecifyEndPointHttpMethod_ShouldFullEqually() {
        var request : APIEndpoint = Constants.createUer
        XCTAssertEqual(apiEndPoint.returnHttpMethodsValue(),request.returnHttpMethodsValue())
    }
    
    
    func test_APIEndpoint_CheckForEndPointFullPath_ShouldFullEqually() {
        var loginUser : APIEndpoint = .loginUser
        var request   : APIEndpoint = .loginUser
        XCTAssertEqual(loginUser.returnValueFullPath(),request.returnValueFullPath())
    }
    
    func test_APIEndpoint_CheckForEndPointBodyHeaderForLogin_ShouldReturnNotNilTrue() {
        var loginUser : APIEndpoint = .loginUser
        XCTAssertNotNil(loginUser.returnBodyHeadersValue(),"If using loginUser enum with header ,Test should return empty")
    }
    
    
}
