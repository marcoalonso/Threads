//
//  ThreadCell.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12.0) {
                CircularProfileImageView(user: nil, size: .small)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    HStack {
                        Text("marco_alonso_r26")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        })
                        
                    }
                    
                    Text("iOS Developer I love the technology")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16.0) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
