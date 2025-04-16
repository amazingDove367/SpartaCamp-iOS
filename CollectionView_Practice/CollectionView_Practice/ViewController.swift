//
//  ViewController.swift
//  CollectionView_Practice
//
//  Created by kingj on 4/15/25.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        let screenWidth = UIScreen.main.bounds.width / 3
        layout.itemSize = CGSize(width: screenWidth, height: 100)
//        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        collectionView.backgroundColor = .gray
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { return CustomCell() }
        
        cell.label.text = "\(indexPath.item)"
        if indexPath.section == 0 {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .blue
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kint == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeue
            header.backgroundColor = .red
        } else {
            let footer = UICollectionReusableView()
            footer.backgroundColor = .red
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell Touched: \(indexPath)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if section == 0 {
//            return .init(top: 0, left: 16, bottom: 0, right: 16)
//        } else {
//            return .init(top: 0, left: 0, bottom: 0, right: 16)
//        }
//    }
}
