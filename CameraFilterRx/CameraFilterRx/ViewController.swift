//
//  ViewController.swift
//  CameraFilterRx
//
//  Created by ✨EUGENE✨ on 2021/10/06.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var applyFilterButton: UIButton!
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
            // 이렇게 직접 이미지를 바꾸기 보다 함수를 새로 작성해서 넣어주는게 좋음
//            self?.photoImageView.image = photo
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
            
        }).disposed(by: disposeBag)
    }

    @IBAction func applyFilterButtonPressed(_ sender: Any) {
        guard let sourceImage = self.photoImageView.image else {
            return
        }
        
        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filteredImage in
                DispatchQueue.main.async {
                    self.photoImageView.image = filteredImage
                }
            })
//        FilterService().applyFilter(to: sourceImage) { filterImage in
//            DispatchQueue.main.async {
//                self.photoImageView.image = filterImage
//            }
//        }
    }
    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.applyFilterButton.isHidden = false
    }
}

