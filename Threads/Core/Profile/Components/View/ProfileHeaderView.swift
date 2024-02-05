//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct ProfileHeaderView: View {
     var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12.0) {
                // fullname and username
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("123 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

#Preview {
    ProfileHeaderView(user: MockData.user)
}
