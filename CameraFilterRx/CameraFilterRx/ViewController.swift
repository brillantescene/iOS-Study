//
//  ViewController.swift
//  CameraFilterRx
//
//  Created by ✨EUGENE✨ on 2021/10/06.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // 이제 옵저버블을 구독하는 방법을 알아보자
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
                  fatalError("segue destination is not found")
              }
        // 이렇게 하면 됨 ㅇvㅇ
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            self?.photoImageView.image = photo
        }).disposed(by: disposeBag)
    }

}

