//
//  TodoListViewModel.swift
//  TodoList_with_chatGPT
//
//  Created by elly on 2023/04/23.
//

import Foundation

class TodoListViewModel {
    var todoList: [TodoItem] = []

    func addTodoItem(title: String) {
        let todoItem = TodoItem(title: title)
        todoList.append(todoItem)
    }

    func deleteTodoItem(at index: Int) {
        todoList.remove(at: index)
    }
    
    func toggleTodoItem(at index: Int) {
        let todoItem = todoList[index]
        todoItem.isCompleted.toggle()
    }
}
