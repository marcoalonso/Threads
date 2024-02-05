//
//  UserContentListView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
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
                ForEach(viewModel.threads) { thread in
                     ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView(user: MockData.user)
}
