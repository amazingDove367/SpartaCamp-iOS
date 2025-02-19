//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 9/23/24.
//

import UIKit

@available(iOS 16.0, *)
class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var recommendationButton: UIButton!
    
    var focusList: [Focus] = Focus.list
    var curated: Bool = false
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendationButton.layer.cornerRadius = 10

        // (diffable data source) presentation, data, (compositional layout) layout
        // presentation - cell
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data - snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
        // layout - compositional layout
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
    }
    
    func updateButtonTitle() {
        // Update Title
        let title = curated ? "See All" : "See Recommendation"
        recommendationButton.setTitle(title, for: .normal)
        recommendationButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    @IBAction func recommendationButtonTapped(_ sender: Any) {
        curated.toggle()
        
        // Update Focus Data
        self.focusList = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(focusList, toSection: .main)
        dataSource.apply(snapshot)
        
        updateButtonTitle()
    }
}
