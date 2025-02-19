//
//  FrameworkController.swift
//  AppleFramework
//
//  Created by Hakyung Sohn on 9/10/24.
//

import UIKit

@available(iOS 16.0, *)
class FrameworkController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let frameworkList: [AppleFramework] = AppleFramework.list
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
      case main
    } // enum is hashable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self // 여러 delegate
        
        navigationController?.navigationBar.topItem?.title = "🩷 Apple Framework"
        
        // Presentation, Data, Layout
        // Presentation: diffable data source
        // dataSource 를 선언만 해줬으니, 할당을 해줘야지. datasource <- presentation, data
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            // cell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.config(item)
            return cell
        })
        
        // Data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(frameworkList, toSection: .main)
        dataSource.apply(snapshot)
        
        // Layout : compositional layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

@available(iOS 16.0, *)
extension FrameworkController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = frameworkList[indexPath.item]
        print(">>> selected : \(framework.name), \(indexPath.item)")
    }
}
