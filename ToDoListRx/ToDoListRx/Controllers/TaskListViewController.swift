//
//  TaskListViewController.swift
//  ToDoListRx
//
//  Created by ✨EUGENE✨ on 2021/10/18.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var prioritysegmentedController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
}
extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        
        return cell
    }
    
    
    
}
extension TaskListViewController: UITableViewDelegate {
    
}
