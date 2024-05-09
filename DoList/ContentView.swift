//
//  ContentView.swift
//  DoList
//
//  Created by Hannah Rappaport on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewTask = false
    var body: some View {
        VStack {
            HStack {
                Text("To Do")
                Spacer()
                Button {
                    withAnimation{
                        self.showNewTask = true }
                } label: {
                    Text("+")
                }
            }
            .padding()
            Spacer()
        }
        if showNewTask {
            NewToDo()
        }
    }
}

#Preview {
    ContentView()
}

/*
 struct ContentView: View {
     @State private var showNewTask = false
     var body: some View {
         VStack {
             HStack {
                 Text("To Do")
                 Spacer()
                 Button {
                     withAnimation{
                         self.showNewTask = true }
                 } label: {
                     Text("+")
                 }
             }
             .padding()
             Spacer()
         }
         if showNewTask {
             NewToDo()
         }
     }
 }
 */
 
