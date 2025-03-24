//
//  InfoView.swift
//  Todoey
//
//  Created by Matthew Barghout on 3/23/25.
//

import SwiftUI

struct InfoView: View {
    @Binding var title: String
    @Binding var schemeColor: Color
    
    let colorOptions: [Color] = [.red, .blue, .green, .yellow, .purple]
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("App Title")){
                    TextField("Enter new title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                }
                Section(header: Text("Accent Color")){
                    HStack{
                        ForEach(colorOptions, id: \.self){ color in
                            Button(action: {
                                schemeColor = color
                            }){
                                Circle()
                                    .fill(color)
                                    .frame(width: 30, height: 30)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.primary, lineWidth: schemeColor == color ? 2 :0)
                                        )
                            }
                        }
                    }
                }
            }
        }
       
    }
}



