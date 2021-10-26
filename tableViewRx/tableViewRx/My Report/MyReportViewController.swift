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
    
    private func bindTableView() {
        let firstCities = ["London", "Vienna", "Lisbon"]
        let secondCities = ["Paris", "Madrid", "Seoul"]
        
        let sections = [
            SectionModel<String, String>(model: "first section", items: firstCities),
            SectionModel<String, String>(model: "second section", items: secondCities)
        ]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: cityDatasource))
            .disposed(by: bag)
    }
    
    private var cityDatasource: CityDataSource {
        let configureCell: (TableViewSectionedDataSource<CitySectionModel>, UITableView,IndexPath, String) -> UITableViewCell = { (datasource, tableView, indexPath,  element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? NameCell else { return UITableViewCell() }
            cell.textLabel?.text = element
            return cell
        }
        
        let datasource = CityDataSource.init(configureCell: configureCell)
        datasource.titleForHeaderInSection = { datasource, index in
            return datasource.sectionModels[index].model
        }
        
        return datasource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
