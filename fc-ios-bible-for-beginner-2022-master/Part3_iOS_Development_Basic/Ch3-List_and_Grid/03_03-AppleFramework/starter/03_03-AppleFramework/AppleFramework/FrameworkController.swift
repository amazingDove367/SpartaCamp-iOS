//
//  FrameworkController.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 9/10/24.
//

import UIKit

class FrameworkController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let frameworkList: [AppleFramework] = AppleFramework.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self // data, cell
        collectionView.delegate = self // 여러 delegate
        
        navigationController?.navigationBar.topItem?.title = "🩷 Apple Framework"
        
        // ⭐️
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // ⭐️ padding
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }

}

extension FrameworkController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frameworkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        let framework = frameworkList[indexPath.item]
        cell.config(framework)
        return cell
    }
}

extension FrameworkController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        // column 3
//        let width = (collectionView.bounds.width - interSpacing * 2 - padding * 2) / 3
        // column 4
        let width = (collectionView.bounds.width - interSpacing * 3 - padding * 2) / 5
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension FrameworkController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = frameworkList[indexPath.item]
        print(">>> selected : \(framework.name), \(indexPath.item)")
    }
}
