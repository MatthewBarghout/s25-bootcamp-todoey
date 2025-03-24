//
//  ContentView.swift
//  Todoey
//
//  Created by Matthew Barghout on 3/4/25.
//
import SwiftUI

struct Todo: Identifiable {
        var id = UUID()
    var item: String
    var isDone: Bool
}


struct ContentView: View {
    @State private var todos: [Todo]=[
        Todo(item: "Buy milk", isDone: false),
        Todo(item: "Learn SwiftUI", isDone: true),
        Todo(item: "Go for a walk", isDone: false)
    ]
    @State private var showInfoView = false
    @State private var title: String = "Reminders"
    @State private var schemeColor: Color = .blue
    
    var body: some View {
        NavigationView{
                VStack{
                    
                    List {
                        ForEach($todos) { $todo in
                            TodoRowView(todo: $todo)                        }
                        .onDelete(perform: deleteTodo)
                    }
                    .listStyle(.insetGrouped)
                    Button(action: addTodo){
                        Text("New Reminder")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    Button(action:{
                        showInfoView.toggle()
                    }){
                        Text("Info")
                            .font(.subheadline)
                            .padding()
                    }
                }
                .navigationTitle(title)
                .sheet(isPresented:$showInfoView){
                    InfoView(title: $title, schemeColor: $schemeColor)
                }
                
            }
        }
        func addTodo(){
            todos.append(Todo(item: "New Reminder", isDone: false))
        }
        func deleteTodo(at offsets: IndexSet){
            todos.remove(atOffsets: offsets)
        }
    }

#Preview {
    ContentView()
        .preferredColorScheme(ColorScheme.dark)
}
