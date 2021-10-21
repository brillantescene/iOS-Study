//
//  ViewController.swift
//  tableViewRx
//
//  Created by ✨EUGENE✨ on 2021/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class ReportViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reportCountLabel: UILabel!
    
    let viewModel = ReportListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

