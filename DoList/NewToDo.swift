//
//  NewToDo.swift
//  DoList
//
//  Created by Hannah Rappaport on 5/9/24.
//

import SwiftUI
import SwiftData

struct NewToDo: View {
    @Bindable var toDoItem: ToDoItem
    @Binding var showNewTask: Bool
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            TextField("Enter task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
            .background(Color(.systemGroupedBackground))
            .cornerRadius(15)
              .padding()
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .padding()
            }
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                    Text("Save")
            }

        }
        .padding()
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDo(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}
