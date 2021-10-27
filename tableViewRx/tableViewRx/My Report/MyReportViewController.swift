//
//  MyReportViewController.swift
//  tableViewRx
//
//  Created by ✨EUGENE✨ on 2021/10/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class MyReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var bag = DisposeBag()
    
    typealias CitySectionModel = SectionModel<String, String>
    typealias CityDataSource = RxTableViewSectionedReloadDataSource<CitySectionModel>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
    }
    
    private func bindTableView() {
        let canceled = ["투썸", "스벅", "할리스"]
        let ing = ["혜리의", "라떼는", "카페"]
        let completed = ["캘리포니아", "도넛클럽", "올댓커피"]
        
        let sections = [
            SectionModel<String, String>(model: "취소된 제보", items: canceled),
            SectionModel<String, String>(model: "진행중인 제보", items: ing),
            SectionModel<String, String>(model: "완료된 제보", items: completed)
        ]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: cityDatasource))
            .disposed(by: bag)
    }
    
    private var cityDatasource: CityDataSource {
        let configureCell: (TableViewSectionedDataSource<CitySectionModel>, UITableView,IndexPath, String) -> UITableViewCell = { (datasource, tableView, indexPath, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? NameCell else { return UITableViewCell() }
            cell.textLabel?.text = element
            return cell
        }
        
        let datasource = CityDataSource.init(configureCell: configureCell)
        
        datasource.canMoveRowAtIndexPath = { dataSource, indexPath in
          return true
        }
        
        datasource.titleForHeaderInSection = { datasource, index in
            return datasource.sectionModels[index].model
        }
        
        return datasource
    }
}
