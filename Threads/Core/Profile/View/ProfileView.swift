//
//  ProfileView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // bio and stats
                VStack(spacing: 20.0) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12.0) {
                            // fullname and username
                            VStack(alignment: .leading, spacing: 4.0) {
                                Text("Marco Alonso 26")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("marcoalonso93")
                                    .font(.subheadline)
                            }
                            
                            Text("iOS Developer and Teacher")
                                .font(.footnote)
                            
                            Text("123 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView(image: Image("marco"))
                    }
                    
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
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.black)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .frame(width: filterBarWidth, height: 1)
                                            .foregroundColor(.clear)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedFilter = filter
                                    }
                                }
                            }
                            
                        }
                        LazyVStack {
                            ForEach(0 ... 10, id: \.self) { thread in
                            ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
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
    ProfileView()
}
