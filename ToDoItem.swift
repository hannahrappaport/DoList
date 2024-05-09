//
//  ToDoItem.swift
//  DoList
//
//  Created by Hannah Rappaport on 5/9/24.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }
    
}
