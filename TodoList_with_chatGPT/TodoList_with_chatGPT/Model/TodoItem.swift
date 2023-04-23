//
//  TodoItem.swift
//  TodoList_with_chatGPT
//
//  Created by elly on 2023/04/23.
//

import Foundation

class TodoItem {
    var title: String
    var isCompleted: Bool

    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
}
