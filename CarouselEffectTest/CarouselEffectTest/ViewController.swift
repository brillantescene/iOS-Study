//
//  ViewController.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let cellSize = CGSize(width: 200, height: 200)
    var minItemSpacing: CGFloat = 20
    let cellCount = 8
    var previousIndex = 0
    
    
    var imageNames = ["blue", "trxye", "wild", "mymymy", "bloom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.height / 2
        setupCollectionView()
        NotificationCenter.default.addObserver(self, selector: #selector(loadIndex), name: NSNotification.Name(rawValue: "index"), object: nil)
    }

    @objc func loadIndex(_ noti: NSNotification) {
        let imageName = noti.object as! String
        imageView.image = UIImage(named: imageName)
    }
    func setupCollectionView() {
        
        let layout = CarouselLayout()
        
//        layout.itemSize = CGSize(width: collectionView.frame.size.width*0.796, height: collectionView.frame.size.height)
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.sideItemScale = 0.8
        layout.spacing = 20
        layout.isPagingEnabled = true
        
        collectionView.collectionViewLayout = layout
        collectionView.layer.masksToBounds = false
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.setCell(imageNames[indexPath.row])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "index"), object: imageNames[indexPath.row])
        cell.layer.masksToBounds = false
        return cell
    }
}
