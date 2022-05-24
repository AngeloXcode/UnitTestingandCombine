//
//  UserResponseTest.swift
//  Task1Tests
//
//  Created by Mac on 23/05/2022.
//

import XCTest

class UserResponseTest: XCTestCase {

    private var user : UserResponse!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = UserResponse(status: "0", message: "User Registration before")
    }

    func testWebService_WhenCreateInstanceOfUser_ShouldReturnTrue(){
        // arrange
        XCTAssertNotNil(user,"If instace is created , Test should be return true")
        
    }

}
