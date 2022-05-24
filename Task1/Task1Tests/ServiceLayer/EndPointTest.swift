//
//  EndPointTest.swift
//  Task1Tests
//
//  Created by Mac on 23/05/2022.
//


import XCTest
import Combine
import SwiftUI

class EndPointTest: XCTestCase {

    private var endPoint : Endpoint!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        endPoint = .createUser
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_CheckForUrl_ShouldReturnTrue(){
        XCTAssertNotNil(endPoint.url,"if set the value for row inside End point, Test should return true")
    }
    
    func test_CheckForMethod_ShouldReturnTrue(){
        XCTAssertNotNil(endPoint.method,"if set the value for row inside End point, Method should return true")
    }


}
