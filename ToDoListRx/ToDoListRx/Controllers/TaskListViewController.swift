//
//  TaskListViewController.swift
//  ToDoListRx
//
//  Created by ✨EUGENE✨ on 2021/10/18.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var prioritysegmentedController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    // RxCocoa 제공 클래스. BehaviorSubject와 비슷
    private var tasks = BehaviorRelay<[Task]>(value: [])
    
    private var filteredTasks = [Task]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.tableView.dataSource = self
        bindUI()
    }
    
    func bindUI() {
        tasks
            .observe(on: MainScheduler.instance)
        // numberOfRowsInSection 이랑 같이 설정하는건 어케하는거람?
            .bind(to: tableView.rx.items(cellIdentifier: TaskTableViewCell.identifier, cellType: TaskTableViewCell.self)) { index, item, cell in
                print("\(index) self.filteredTasks.count \(self.filteredTasks.count)")
//                if index < self.filteredTasks.count {
//                    cell.titleLabel.text = self.filteredTasks[index].title
//                } else {
//                    cell.titleLabel.text = ""
//                }
                cell.titleLabel.text = self.filteredTasks[index].title
            }
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addTVC = navC.viewControllers.first as? AddTaskViewController else {
                  fatalError("Controller not found")
              }
        print("prepare~!")
        addTVC.taskSubjectObservable
            .subscribe(onNext: {task in
                print("subscribe~!")
                let priority = Priority(rawValue: self.prioritysegmentedController.selectedSegmentIndex - 1)
                
                var existingTask = self.tasks.value
                existingTask.append(task)
                self.tasks.accept(existingTask)
//
                self.filterTasks(by: priority)
            }).disposed(by: disposeBag)
    }
    
    @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex - 1)
        print("priority \(priority)")
        filterTasks(by: priority)
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    private func filterTasks(by priority: Priority?) {
        
        if priority == nil {
            print("All")
            self.filteredTasks = self.tasks.value
            self.updateTableView()
        } else {
            self.tasks.map { tasks in
                tasks.filter { $0.proprity == priority! }
            }.subscribe(onNext: { tasks in
                self.filteredTasks = tasks
                self.updateTableView()
            }).disposed(by: disposeBag)
        }
    }
}
//extension TaskListViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredTasks.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
//        cell.textLabel?.text = self.filteredTasks[indexPath.row].title
//        return cell
//    }
//}
