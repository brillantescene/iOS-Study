//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by ✨EUGENE✨ on 2021/04/15.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var baseCollectionView: UICollectionView!
    @IBOutlet weak var sectionHeaderlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
            sectionHeader.sectionHeaderlabel.text = "유슙님의 영화로그"
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

