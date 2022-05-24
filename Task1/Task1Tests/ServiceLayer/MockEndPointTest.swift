//
//  MockEndPointTest.swift
//  Task1Tests
//
//  Created by Mac on 23/05/2022.
//

import XCTest
import Combine
import SwiftUI
@testable import Task1



class MockEndPointTest: XCTestCase {

    private var mockRequestParamter : MockRequestParamter!
    private var uRLRequst           : UrlRequst!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.mockRequestParamter = MockRequestParamter()
        self.uRLRequst = UrlRequst(request: self.mockRequestParamter)
        
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_mockRequestparameter_CheckIfURLRequestCreated_ShouldReturnTrue(){
        let urlRequst =  self.uRLRequst.asURLRequest()
        XCTAssertNotNil(urlRequst,"If URLRequest is Create , Test Shouldn't return nil")
    }


}
