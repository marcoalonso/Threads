//
//  ContentView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    /// -* Creamos una instancia del VM para validar si Auth service encuentra una sesion activa de firebase
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
