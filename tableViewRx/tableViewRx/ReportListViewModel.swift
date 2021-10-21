//
//  ReportListViewModel.swift
//  tableViewRx
//
//  Created by ✨EUGENE✨ on 2021/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class ReportListViewModel {
    
    var reportObservable = BehaviorSubject<[Report]>(value: [])
    var reports = BehaviorRelay<[Report]>(value: [])
    
    
    lazy var itemsCount = reportObservable.map { $0.count }
    var disposeBag = DisposeBag()
    
    init() {
        self.reports.accept([
            Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
            Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
            Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
            Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
            Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고")
            ])
        
        reportObservable.onNext(reports.value)
    }
    
    func onAdd() {
//        reportObservable.onNext([Report(date: "2021.10.21", title: "새로운 윶니의 카페", address: "서울특별시 어쩌고")])
//        var existReports = self.reports.value
//        existReports.append(Report(date: "2021.10.21", title: "새로운 윶니의 카페", address: "서울특별시 어쩌고"))
//        self.reports.accept(existReports)
//        print(reports.value)
        reportObservable
            .subscribe(onNext: { report in
                var existReports = self.reports.value
                existReports.append(Report(date: "2021.10.21", title: "새로운 윶니의 카페", address: "서울특별시 어쩌고"))
                self.reports.accept(existReports)
                print(self.reports.value)
            })
            .disposed(by: disposeBag)
//        print(reports.value)
    }
}
