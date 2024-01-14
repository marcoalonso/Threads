//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    let image: Image
    
    var body: some View {
            image
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(image: Image(systemName: "person"))
}
