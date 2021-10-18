//
//  AddTaskViewController.swift
//  ToDoListRx
//
//  Created by ✨EUGENE✨ on 2021/10/18.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBAction func save() {
        
        guard let priority = Priority(rawValue: prioritySegmentedControl.selectedSegmentIndex),
              let title = self.taskTitleTextField.text else {
                  return
              }
        let task = Task(title: title, proprity: priority)
        
        taskSubject.onNext(task)
        self.dismiss(animated: true, completion: nil)
    }
}
