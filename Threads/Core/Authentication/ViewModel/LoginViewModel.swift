//
//  LoginViewModel.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 18/01/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    @Published var alertItem: AlertItem?
    
    var cancelables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email,
                                      password: password)
    }
    
    func setupSubscribers() {
        AuthService.shared.$alertItem.sink { [weak self] alertItem in
            self?.alertItem = alertItem
        }.store(in: &cancelables)
    }
}
