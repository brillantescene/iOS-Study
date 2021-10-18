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
    
    override func viewDidLoad() {
        viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
extension TaskListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
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
