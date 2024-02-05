//
//  ProfileView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
  
    
    var body: some View {
        ScrollView {
            // bio and stats
            VStack(spacing: 20.0) {
                ProfileHeaderView(user: user)
                
                Button(action: {
                    
                }, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })
                
                //user content list view
                UserContentListView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        
    }
}

#Preview {
    ProfileView(user: MockData.user)
}
