//
//  RegistrationView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 02/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
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
                TextField("Enter your email", text: $email)
                    .modifier(TextFieldModifiers())
                
                SecureField("Enter your password", text: $password)
                    .modifier(TextFieldModifiers())
                    .autocapitalization(.none)
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(TextFieldModifiers())
                
                TextField("Enter your username", text: $username)
                    .modifier(TextFieldModifiers())
            }
            
            Button(action: {
                
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
