//
//  TodoListTableViewCell.swift
//  TodoList_with_chatGPT
//
//  Created by elly on 2023/04/23.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    static let cellIdentifier: String = "todo_list_tableview_cell"
    @IBOutlet weak var titleLabel: UILabel!
    
    func bind(_ todoItem: TodoItem) {
        titleLabel.text = todoItem.title
        self.accessoryType = todoItem.isCompleted ? .checkmark : .none
    }
}
