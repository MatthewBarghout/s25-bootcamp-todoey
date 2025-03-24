//
//  TodoRowView.swift
//  Todoey
//
//  Created by Matthew Barghout on 3/23/25.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo : Todo
    var body: some View {
        HStack{
                Button(action:{
                    todo.isDone.toggle()
                }){
                    Image(systemName:todo.isDone ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(todo.isDone ?.green:.gray)
                    
                
            }
            TextField("Enter todo",text:$todo.item)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.vertical,4)
                
            }
        }
    

