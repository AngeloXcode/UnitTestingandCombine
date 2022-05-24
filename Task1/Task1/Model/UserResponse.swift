//
//  UserResponse.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation

struct UserResponse : Codable {
    var status  : String?
    var message : String?

    
    init(status:String,message:String){
        self.status  = status
        self.message = message
    }
}
