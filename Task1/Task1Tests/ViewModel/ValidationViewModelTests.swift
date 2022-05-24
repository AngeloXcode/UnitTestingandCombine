//
//  ValidationViewModelTests.swift
//  Task1Tests
//
//  Created by Mac on 22/05/2022.
//

import XCTest
import Combine
import SwiftUI
@testable import Task1

class ValidationViewModelTests : XCTestCase {
    //Arrage
    private var validationVM : ValidationViewModel!
    
    override func setUp() {
        super.setUp()
        self.validationVM = ValidationViewModel()
        
    }
    
    
    func testValidationViewModel_WhenValidFirstNameNotProvided_ShouldReturnFalse(){
        
        self.validationVM.userName = ""
        self.validationVM.startValidate()
       _ =  self.validationVM.$isuserNameVerified.sink { value in
           XCTAssertTrue(value,"if username is empty , then return ture")
           XCTAssertTrue(!self.validationVM.userNamePrompt.isEmpty,self.validationVM.userNamePrompt)
        }
    }
    
    func testValidationViewModel_WhenValidFirstNameProvided_ShouldReturnTrue(){

        self.validationVM.userName = "Angelo Essam Saber"
        self.validationVM.startValidate()
        _ =  self.validationVM.$isuserNameVerified.sink { value in
            XCTAssertFalse(value,"if username isn't empty , then return false")
            XCTAssertTrue(self.validationVM.userNamePrompt.isEmpty,self.validationVM.userNamePrompt)
        }

    }
//
    func testValidationViewModel_WhenValidEmailNotProvided_ShouldReturnFalse(){

        self.validationVM.email = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isEmailVerified.sink { value in
            XCTAssertFalse(value,"if email is empty , then return false")
            XCTAssertTrue(!self.validationVM.emailPrompt.isEmpty,self.validationVM.emailPrompt)
        }
    }


    func testValidationViewModel_WhenValidEmailProvided_ShouldReturnTrue(){

        self.validationVM.email = "angelo@gmail.com"
        self.validationVM.startValidate()
        _ =  self.validationVM.$isEmailVerified.sink { value in
            XCTAssertTrue(value,"if email is correct , then return true")
            XCTAssertTrue(self.validationVM.emailPrompt.isEmpty,self.validationVM.emailPrompt)
        }
    }


    func testValidationViewModel_WhenValidEmailProvidedWithIncorrectForamt_ShouldReturnFalse(){

        self.validationVM.email = "angelo@gm"
        self.validationVM.startValidate()
        _ =  self.validationVM.$isEmailVerified.sink { value in
            XCTAssertFalse(value,"if email is incorrect Format , then return false")
            XCTAssertTrue(!self.validationVM.emailPrompt.isEmpty,self.validationVM.emailPrompt)
        }
    }


    func testValidationViewModel_WhenPasswordIsEmpty_ShouldReturnFalse(){

        self.validationVM.password = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isPasswordVerified.sink { value in
           XCTAssertFalse(value,"if password is empty , then return false")
           XCTAssertTrue(!self.validationVM.passwordPrompt.isEmpty ,"if password is empty ,message error should be not empty")
        }
    }

    func testValidationViewModel_WhenPasswordIsEmpty_ShouldReturnTrue(){

        self.validationVM.password = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isPasswordVerified.sink { value in
           XCTAssertFalse(value,"if password is empty , then return false")
           XCTAssertTrue(!self.validationVM.passwordPrompt.isEmpty ,"if password is empty ,message error should be not empty")
        }
    }


    func testValidationViewModel_WhenConfirmPasswordIsEmpty_ShouldReturnFalse(){

        self.validationVM.confirmPassword = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isConfirmPasswordVerified.sink { value in
           XCTAssertFalse(value,"if confirm password is empty , then return false")
           XCTAssertTrue(!self.validationVM.confirmPasswordPrompt.isEmpty ,"if password is empty ,message error should be not empty")
        }
    }

    func testValidationViewModel_WhenConfirmPasswordIsEmpty_ShouldReturnTrue(){

        self.validationVM.confirmPassword = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isConfirmPasswordVerified.sink { value in
           XCTAssertFalse(value,"if password is empty , then return false")
            XCTAssertTrue(!self.validationVM.confirmPasswordPrompt.isEmpty ,"if password is empty ,message error should be not empty")
        }
    }


    func testValidationViewModel_WhenTwoPasswordIfNotTheSame_ShouldReturnFalse(){

        self.validationVM.confirmPassword  = "maro12354"
        self.validationVM.password         = "maro1235"
        self.validationVM.startValidate()
        _ =  self.validationVM.$isTwoPasswordVerified.sink { value in
           XCTAssertFalse(value,"if password and confirm password is not the same , Test sholud return false")
           XCTAssertTrue(!self.validationVM.confirmTwoPasswordPrompt.isEmpty ,"if password and the confirm password isn't the same ,message error should be not empty")
        }
    }

    func testValidationViewModel_WhenTwoPasswordIfTheSame_ShouldReturnTrue(){

        self.validationVM.confirmPassword  = "maro12354"
        self.validationVM.password         = "maro12345"
        self.validationVM.startValidate()
        _ =  self.validationVM.$isTwoPasswordVerified.sink { value in
            XCTAssertFalse(value,"if password and confirm password is the same , Test sholud return true")
            XCTAssertTrue(!self.validationVM.confirmTwoPasswordPrompt.isEmpty ,"if password and confirm password is the same ,message error should be not empty")
        }
    }

    func testValidationViewModel_WhenTwoPasswordIsEmpty_ShouldReturnfalse(){

        self.validationVM.password         = ""
        self.validationVM.confirmPassword  = ""
        self.validationVM.startValidate()
        _ =  self.validationVM.$isTwoPasswordVerified.sink { value in
           XCTAssertFalse(value,"if password and confirm password is empty , Test sholud return false")
           XCTAssertTrue(!self.validationVM.confirmTwoPasswordPrompt.isEmpty ,"if password and the confirm password is empty ,message error should be not empty")
        }
    }


    func testValidationViewModel_WhenRegisterFieldIsValid_ShouldReturnTrue(){

        self.validationVM.userName        = "username"
        self.validationVM.email           = "angelo@gmail.com"
        self.validationVM.password        = "maro1234567"
        self.validationVM.confirmPassword = "maro1234567"
        self.validationVM.startValidate()

        _ =  self.validationVM.$isRegister.sink { value in
           XCTAssertFalse(value,"if all fields aren't empty , Test shold return false")
           XCTAssertTrue(self.validationVM.userNamePrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
            XCTAssertTrue(self.validationVM.emailPrompt.isEmpty ,"if email isn't empty ,message error should be empty")
            XCTAssertTrue(self.validationVM.passwordPrompt.isEmpty ,"if password isn't empty ,message error should be empty")
            XCTAssertTrue(self.validationVM.confirmPasswordPrompt.isEmpty ,"if confirm password isn't empty ,message error should be empty")


        }
    }

    func testValidationViewModel_CheckIfFieldsNotNil_ShouldReturnTrue(){
        XCTAssertNotNil(self.validationVM.userName,"if username is empty , Test shold return true")
        XCTAssertNotNil(self.validationVM.email,"if email is empty , Test shold return true")
        XCTAssertNotNil(self.validationVM.password,"if password is empty , Test shold return true")
        XCTAssertNotNil(self.validationVM.confirmPassword,"if confirmPassword is empty , Test shold return true")

    }
    
    
    func
    testValidationViewModel_IfisEmailVerifiedIsFalse_emailPromptShouldbeEmptyString(){
        self.validationVM.isEmailVerified = false
        XCTAssertTrue(!self.validationVM.emailPrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
    

    }
    
    func testValidationViewModel_IfisuserNameVerifiedIsFalse_userNamePromptShouldbeEmptyString(){
        self.validationVM.isuserNameVerified = true
        XCTAssertTrue(!self.validationVM.userNamePrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
    

    }
    
    func testValidationViewModel_IFisPasswordVerifiedIsFalse_passwordPromptShouldbeEmptyString(){
        self.validationVM.isPasswordVerified = false
        XCTAssertTrue(!self.validationVM.passwordPrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
    

    }
    
    func testValidationViewModel_IFisConfirmPasswordVerifiedIsFalse_confirmPasswordPromptShouldbeEmptyString(){
        self.validationVM.isConfirmPasswordVerified = false
        XCTAssertTrue(!self.validationVM.confirmPasswordPrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
    

    }
    
    func testValidationViewModel_IFisTwoPasswordVerifiedIsFalse_confirmTwoPasswordPromptShouldbeEmptyString(){
        self.validationVM.isTwoPasswordVerified = false
        XCTAssertTrue(!self.validationVM.confirmTwoPasswordPrompt.isEmpty ,"if userName isn't empty ,message error should be empty")
    

    }
    

    
}
