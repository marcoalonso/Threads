//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    @Published  var fullname = ""
    @Published  var username = ""
    @Published var alertItem: AlertItem?
    
    var cancelables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                      password: password,
                                      fullname: fullname,
                                      username: username)
    }
    
    func setupSubscribers() {
        AuthService.shared.$alertItem.sink { [weak self] alertItem in
            DispatchQueue.main.async {
                self?.alertItem = alertItem
            }
        }.store(in: &cancelables)
    }
}
