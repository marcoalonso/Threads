//
//  UserCell.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            VStack(alignment: .leading, spacing: 2) {
                Text(user.fullname)
                    .fontWeight(.semibold)
                
                Text(user.username)
                    
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4))
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: MockData.user)
}
