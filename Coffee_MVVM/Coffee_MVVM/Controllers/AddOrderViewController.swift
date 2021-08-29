//
//  AddOrderViewController.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/27.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var vm = AddCoffeeOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddOrderViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.coffeeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.coffeeNames[indexPath.row]
        return cell
    }
    
    
}
