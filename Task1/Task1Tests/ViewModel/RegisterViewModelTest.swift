//
//  RegisterViewModel.swift
//  Task1Tests
//
//  Created by Mac on 23/05/2022.
//

import XCTest
import Combine
import SwiftUI
@testable import Task1

class RegisterViewModelTest : XCTestCase {

    private var register : RegisterViewModel!
    override func setUpWithError() throws {
        super.setUp()
        register = RegisterViewModel()
    }
    
    func testRegisterViewModel_WhenCreateInstanceOfModel_ShouldReturntrue(){
        
        XCTAssertNotNil(register,"If Register ViewModel instace is created , Test should be return true")
        
    }
}


