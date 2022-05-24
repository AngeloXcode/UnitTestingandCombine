//
//  WebService.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation
import Combine

protocol WebServiceProtocal{
    func sendRequest<T: Decodable>(_ decoder: JSONDecoder) -> AnyPublisher<T, Error>
}

class WebService : WebServiceProtocal{
    
    private var urlSession : URLSession!
    private var request    : URLRequest!
    
    init(request:URLRequest,urlSession : URLSession = .shared){
        self.request    = request
        self.urlSession = urlSession
    }
    
    func sendRequest<T>(_ decoder: JSONDecoder) -> AnyPublisher<T, Error> where T : Decodable {
        return self.urlSession
                .dataTaskPublisher(for:self.request)
                .map(\.data)
                .decode(type: T.self, decoder: decoder)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
      
}



