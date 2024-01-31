//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 27/01/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("Debug: user viewmodel is \(String(describing: user))")

        }.store(in: &cancellables)
    }
    
   
}
