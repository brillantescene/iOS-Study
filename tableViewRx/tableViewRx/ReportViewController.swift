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
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        viewModel.onAdd()
    }
    
    func setUI() {
        viewModel.reportObservable
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: ReportItemTableViewCell.identifier,
                                         cellType: ReportItemTableViewCell.self)) { index, item, cell in
                cell.date.text = item.date
                cell.title.text = item.title
                cell.address.text = item.address
                self.updateUI()
            }
            .disposed(by: disposeBag)
        
        viewModel.itemsCount
            .map { "\($0)" }
            .observe(on: MainScheduler.instance)
//            .bind(to: reportCountLabel.rx.text)
            .subscribe(onNext: {
                self.reportCountLabel.text = $0
//                print($0)
            })
            .disposed(by: disposeBag)
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

