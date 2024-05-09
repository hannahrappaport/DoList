//
//  DoListApp.swift
//  DoList
//
//  Created by Hannah Rappaport on 5/9/24.
//

import SwiftUI
import SwiftData

@main
struct DoListApp: App {
    var body: some Scene {
        WindowGroup {
                    ContentView()
                        .modelContainer(for: ToDoItem.self)
                }
    }
}
