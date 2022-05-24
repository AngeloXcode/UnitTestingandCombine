//
//  APIError.swift
//  Task1
//
//  Created by Mac on 24/05/2022.
//

import Foundation

enum APIError : Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int)
    case jsonDecodingError(error: String)
    case unreachable
    
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "NetworkErrorRequest"
        case .invalidResponse:
            return "NetworkErrorResponse"
        case .jsonDecodingError(let error):
            return error
        case .dataLoadingError(let statusCode):
            return "Error :\(statusCode)"
        case .unreachable:
            return "unreachable"
        }
    }
}

extension APIError : Equatable {
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
}
