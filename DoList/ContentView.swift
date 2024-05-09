//
//  ContentView.swift
//  DoList
//
//  Created by Hannah Rappaport on 5/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack {
            HStack {
                Text("To Do")
                    .font(.title)
                Spacer()
                Button {
                    withAnimation{
                        self.showNewTask = true }
                } label: {
                    Text("+")
                        .font(.title)
                }
            }
            .padding()
            Spacer()
            List {
                ForEach (toDos) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                            }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDo(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}


 
