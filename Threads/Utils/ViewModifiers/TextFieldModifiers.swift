//
//  TextFieldModifiers.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 02/01/24.
//

import Foundation
import SwiftUI

struct TextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal, 24)
    }
}


    
