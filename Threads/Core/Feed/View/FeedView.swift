//
//  FeedView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ..< 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("refresh threads!")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: ("arrow.counterclockwise"))
                        .foregroundColor(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
