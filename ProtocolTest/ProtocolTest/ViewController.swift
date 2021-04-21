//
//  ViewController.swift
//  ProtocolTest
//
//  Created by ✨EUGENE✨ on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableViewNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableViewNib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.setCell()
        cell.delegate = self
        return cell
    }
}
extension ViewController: CVCellDelegate {
    func selectedCVCell(_ index: Int) {
        guard let vc = UIStoryboard(name: "PopUpView", bundle: nil).instantiateViewController(withIdentifier: "PopUpVC") as? PopUpVC else {
            return
        }
        
        vc.cellNum = "\(index)번째 셀"
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
