//
//  AddTaskViewController.swift
//  ToDoListRx
//
//  Created by ✨EUGENE✨ on 2021/10/18.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    // 서브젝트를 프라이빗으로 만들어두고
    private let taskSubject = PublishSubject<Task>()
    
    // 외부에서 접근할 땐 taskSubjectObservable 쓰기
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBAction func save() {
        
        // save
        guard let priority = Priority(rawValue: prioritySegmentedControl.selectedSegmentIndex),
              let title = self.taskTitleTextField.text else {
                  return
              }
        
        let task = Task(title: title, proprity: priority)
        print("\(task) \(prioritySegmentedControl.selectedSegmentIndex)")
        // task 이벤트 보내기
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
    }
}
