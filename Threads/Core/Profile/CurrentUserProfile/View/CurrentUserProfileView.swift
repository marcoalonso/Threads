//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfileView = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // bio and stats
                VStack(spacing: 20.0) {
                   
                    ProfileHeaderView(user: currentUser)
                    
                    Button(action: {
                        showEditProfileView.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4))
                            }
                    })
                    
                    //user content list view
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfileView, content: {
                EditProfileView()
                    .environmentObject(viewModel)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
