//
//  TabBarView.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import UIKit

protocol PagingTabbarDelegate {
    func scrollToIndex(to index: Int)
}

class TabBarView: UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let vm = TabViewModel()
    var delegate: PagingTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setConstraint()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
        setConstraint()
    }
    private func loadView() {
        if let view = Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
        view.addSubview(indicatorView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabCollectionViewCell")
    }
    
    func scroll(to index: Int) {
        collectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: [])
    }
    
    var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = .systemBlue
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    var indicatorLeadingConstraint: NSLayoutConstraint!
    
    private func setConstraint() {
        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: self.collectionView.frame.width / 6),
            indicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            indicatorLeadingConstraint
        ])
    }
}
extension TabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vm.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tabLabel.text = self.vm.tabTypes[indexPath.row]
        return cell
    }
}

extension TabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
        let cellWidth = collectionView.frame.width / 4
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension TabBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToIndex(to: indexPath.row)
        print(indexPath.row)
    }
}
