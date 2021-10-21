//
//  ReportListViewModel.swift
//  tableViewRx
//
//  Created by ✨EUGENE✨ on 2021/10/21.
//

import Foundation
import RxSwift

class ReportListViewModel {
    
    var reportObservable = PublishSubject<[Report]>()
    
    lazy var itemsCount = reportObservable.map { $0.count }
    
    init() {
        var reports = [
        Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
        Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
        Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
        Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고"),
        Report(date: "2021.08.20", title: "혜리의 라떼는 카페", address: "경기 고양시 어쩌고")
        ]
        
        reportObservable.onNext(reports)
        
    }
}
