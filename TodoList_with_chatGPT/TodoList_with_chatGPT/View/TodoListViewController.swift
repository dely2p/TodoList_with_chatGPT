//
//  TodoListViewController.swift
//  TodoList_with_chatGPT
//
//  Created by elly on 2023/04/23.
//

import UIKit

class TodoListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTodoItemButton: UIBarButtonItem!

    let viewModel = TodoListViewModel()
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addTodoItemButtonTapped(_ sender: Any) {
        viewModel.addTodoItem(title: "Project \(index)")
        index += 1
        tableView.reloadData()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.cellIdentifier, for: indexPath) as? TodoListTableViewCell else { return UITableViewCell() }
        let todoItem = viewModel.todoList[indexPath.row]
        cell.bind(todoItem)
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggleTodoItem(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteTodoItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            index -= 1
        }
    }
}
