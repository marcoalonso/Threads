//
//  CreateThreadView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(image: Image("marco"))
                    
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text("marco_alonso_93")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread ...", text: $caption, axis: .vertical)
                        
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button(action: {
                            caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
