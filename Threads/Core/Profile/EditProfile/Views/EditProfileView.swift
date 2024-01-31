//
//  EditProfileView.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 15/01/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // Name and profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Marco Alonso")
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(image: Image("alonso"))
                            }
                        }
                    }
                    
                    Divider()
                    
                    // Bio fields
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio ...", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    //Link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Addlink ...", text: $link, axis: .vertical)
                    }
                    
                    
                    Divider()
                    
                    // Private profile
                    Toggle("Private profile", isOn: $isPrivateProfile)
                    
                    Divider()
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4) , lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    })
                }
            }
            
        }
    }
}

#Preview {
    EditProfileView()
}
