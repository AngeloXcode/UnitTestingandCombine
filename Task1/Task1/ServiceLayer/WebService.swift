//
//  WebService.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation
import Combine

protocol WebServiceProtocal{
    func sendRequest<T:Decodable>(_ endpoint : APIEndpoint) -> AnyPublisher<T, APIError>
}

class WebService : WebServiceProtocal{
    private var urlSession : URLSession!
    private var subscriptions = Set<AnyCancellable>()
    
    init(urlSession : URLSession = .shared){
        self.urlSession = urlSession
    }
    
    func sendRequest<T:Decodable>(_ endpoint : APIEndpoint) -> AnyPublisher<T, APIError>{
        return self.urlSession.dataTaskPublisher(for:endpoint.request)
            .tryMap { data, response -> T in
                guard
                    let response = response as? HTTPURLResponse,
                    (200..<300).contains(response.statusCode)
                else {
                    throw APIError.invalidRequest
                }
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    print("Unable to Decode Response \(error)")
                    throw APIError.invalidRequest
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError :
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.invalidResponse
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        
        
    }
    
    
}



