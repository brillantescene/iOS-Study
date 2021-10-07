//
//  PhotosCollectionViewController.swift
//  CameraFilterRx
//
//  Created by ✨EUGENE✨ on 2021/10/06.
//

import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("PhotoCollectionViewCell is not found")
        }
        
        let asset = self.images[indexPath.row]
        let manager = PHImageManager.default()
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        return cell
    }
    private func populatePhotos() {
        
        // 권한 요청
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            if status == .authorized {
                // 사진 라이브러리 액세스 허용
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { (object, count, stop) in
                    self?.images.append(object)
                }
                
                self?.images.reverse()
//                print(self?.images)
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
            }
        }
    }
}
