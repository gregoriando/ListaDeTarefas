//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Gregory Luiz lopes freire on 22/05/24.
//

import UIKit

class TaskTableViewController: UIViewController {
    
    
    private lazy var taskTableView: UITableView = {
        let tableview = UITableView(frame: .zero)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Lista De Tarefas"
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(taskTableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TaskTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as? TaskTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
}

extension TaskTableViewController: UITableViewDelegate {

}

