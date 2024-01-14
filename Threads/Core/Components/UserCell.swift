//
//  UserCell.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView(image: Image("alonso"))
            VStack {
                Text("Marco Alonso 93")
                    .fontWeight(.semibold)
                
                Text("alonso rodriguez")
                    
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
    UserCell()
}
