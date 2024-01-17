//
//  RegistrationView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 02/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("theads")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(TextFieldModifiers())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldModifiers())
                    .autocapitalization(.none)
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(TextFieldModifiers())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(TextFieldModifiers())
            }
            
            Button(action: {
                Task {
                    try await viewModel.createUser()
                }
            }, label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            })
            .padding(.vertical)
            
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
