//
//  RegisterViewModel.swift
//  Task1
//
//  Created by Mac on 23/05/2022.
//

import Foundation
import SwiftUI
import Combine

class RegisterViewModel : ObservableObject {
    @Published var data : UserResponse!
    private var cancellables = Set<AnyCancellable>()
    let apiClient : APIClient
    
    init(apiClient : APIClient){
        self.apiClient = apiClient
    }
    
    private func createUser(){
        self.apiClient.createUser()
            .sink { _ in
                
            } receiveValue: { data in
                self.data = data
            }.store(in: &cancellables)
        
        
    }
}
