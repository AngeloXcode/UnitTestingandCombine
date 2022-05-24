//
//  MockRequestParamter.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation


class MockRequestParamter : RequestParamter{
    var endPoint: Endpoint = .createUser
    var model: [String : String] =  [
        "user_name"   : "aas",
        "user_email"  : "eng.angloesam2010@gmail.com",
        "user_password"   :  "123456789"
    ]
    var headers: [String : String]? = [:]
}
