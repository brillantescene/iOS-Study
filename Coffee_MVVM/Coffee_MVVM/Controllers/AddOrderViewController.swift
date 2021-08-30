//
//  AddOrderViewController.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/27.
//

import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}
class AddOrderViewController: UIViewController {

    var delegate: AddCoffeeOrderDelegate?
    private var vm = AddCoffeeOrderViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var coffeeSizeSegmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
    @IBAction func close() {
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
        }
    }
    @IBAction func save() {
        let name = self.nameTextField.text
        let total = self.totalTextField.text
        
        let selectedSize = self.coffeeSizeSegmentControl.titleForSegment(at: self.coffeeSizeSegmentControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!")
        }
        
        self.vm.name = name
        self.vm.total = total?.doubleValue
        self.vm.selectedCoffee = self.vm.coffeeNames[indexPath.row]
        self.vm.selectedSize = selectedSize
        
        WebService().load(resource: Order.create(vm: self.vm)) { result in
            
            switch result {
                case .success(let order):
                    print("save")
                    if let order = order, let delegate = self.delegate {
                        DispatchQueue.main.async {
                            delegate.addCoffeeOrderViewControllerDidSave(order: order, controller: self)
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}
extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.coffeeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.coffeeNames[indexPath.row]
        return cell
    }
    
    
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}
