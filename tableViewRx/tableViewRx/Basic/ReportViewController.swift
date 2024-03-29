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
//        viewModel.reports.accept([Report(date: "2021.10.21", title: "새로운 윶니의 카페", address: "서울특별시 어쩌고")])
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
            }
            .disposed(by: disposeBag)
        
        viewModel.itemsCount
            .map { "\($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: reportCountLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

