//
//  StockViewController.swift
//  StockRank
//
//  Created by Hakyung Sohn on 9/11/24.
//

import UIKit

class StockViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let stockList: [StockModel] = StockModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }
}

extension StockViewController: UICollectionViewDataSource {
    // data
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockCollectionViewCell", for: indexPath) as? StockCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.config(stockList[indexPath.item])
        return cell
    }
}

extension StockViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
