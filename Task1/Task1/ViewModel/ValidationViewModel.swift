//
//  ValidationViewModel.swift
//  Task1
//
//  Created by Mac on 22/05/2022.
//

import Foundation
import SwiftUI
import Combine




class ValidationViewModel : ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var userName        : String = ""
    @Published var email           : String = ""
    @Published var password        : String = ""
    @Published var confirmPassword : String = ""
    
    @Published var isuserNameVerified         : Bool = false
    @Published var isEmailVerified            : Bool = false
    @Published var isPasswordVerified         : Bool = false
    @Published var isConfirmPasswordVerified  : Bool = false
    @Published var isTwoPasswordVerified      : Bool = false
    
    
    @Published var isRegister                 : Bool = false
    @Published var isLogin                    : Bool = false
    
    private var disposables = Set<AnyCancellable>()
    
    
    var userNamePrompt : String {
        isuserNameVerified ?  "يجب ان يكون كلمة المرور علي الاقل ٦ حروف" : ""
    }
    
    
    var emailPrompt : String {
        isEmailVerified ?  "" : "من فضلك تإكد ان البريد الإلكتروني مكتوب بطريقة صحيحة"
    }
    
    
    var passwordPrompt : String {
        isPasswordVerified ?   "" : "يجب ان تكون كلمة المرور ٦ أحرف على الأقل ، حرف واحد على الأقل ورقم واحد"
    }
    
    var confirmPasswordPrompt : String {
        isConfirmPasswordVerified ?  "" :  "من فضلك تإكد ان كلمة المرور متطابقة"
    }
    
    var confirmTwoPasswordPrompt : String {
        isTwoPasswordVerified ?  "" :  "من فضلك تإكد ان كلمة المرور متطابقة"
    }
    
    // MARK: - FUNCTION
    init(){
    }
    
    func startValidate(){
        $userName.map{ _ in
            return self.userName.isEmpty
        }.assign(to: \.isuserNameVerified,on:self)
            .store(in:&disposables)
        
        $email.map{ email in
            return Predicate.emailPredicate.evaluate(with: email)
        }.assign(to: \.isEmailVerified, on: self)
            .store(in:&disposables)
        
        
        $password.map{ password in
            return Predicate.passwordPredicate.evaluate(with: password)
        }.assign(to: \.isPasswordVerified, on: self)
            .store(in:&disposables)
        
        
        $confirmPassword.map{ password in
            return Predicate.passwordPredicate.evaluate(with:password)
        }.assign(to: \.isConfirmPasswordVerified, on: self)
            .store(in:&disposables)
        
        
        Publishers.CombineLatest($password,$confirmPassword)
            .map{ pass, confirmPass in
                return (pass == confirmPass) && (!pass.isEmpty) && (!confirmPass.isEmpty)
            }
            .assign(to: \.isTwoPasswordVerified,on:self)
            .store(in:&disposables)
        
        //        // MARK: - Register
        Publishers.CombineLatest4($isEmailVerified, $isPasswordVerified,$isConfirmPasswordVerified,$isuserNameVerified)
            .map { isEmailVerified, isPasswordVerified,isConfirmPasswordVerified,isuserNameVerified in
                return (isEmailVerified && isPasswordVerified && isConfirmPasswordVerified && isuserNameVerified)
            }.assign(to: \.isRegister, on: self)
            .store(in:&disposables)
    }
    
    
}
