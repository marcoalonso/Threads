//
//  ThreadCell.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 13/01/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12.0) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(timeDifferenceString(from: thread.timeStamp.dateValue()))")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        })
                        
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16.0) {
                        Button(action: {
                            
                        }, label: {
                            ZStack {
                                Image(systemName: "heart")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.red) // Color de la imagen, puedes ajustarlo según tus necesidades
                                Text("\(thread.likes)")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red) // Color del fondo del número, puedes ajustarlo según tus necesidades
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10) // Ajusta la posición del número según sea necesario
                            }
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
    
    func timeDifferenceString(from date: Date) -> String {
           let currentDate = Date()
           let calendar = Calendar.current
           let components = calendar.dateComponents([.minute, .hour, .day], from: date, to: currentDate)
           
           if let day = components.day, day > 0 {
               return "\(day) día(s) atrás"
           } else if let hour = components.hour, hour > 0 {
               return "\(hour) hora(s) atrás"
           } else if let minute = components.minute, minute > 0 {
               return "\(minute) minuto(s) atrás"
           } else {
               return "Hace un momento"
           }
       }
}

#Preview {
    ThreadCell(thread: MockData.thread)
}
