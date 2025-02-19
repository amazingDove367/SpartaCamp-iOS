//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
// 과제: 아래 애플 샘플 코드 다운받아서 돌려보기  https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views

@available(iOS 16.0, *)
class PaywallViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerList: [BannerInfo] = BannerInfo.list
    let bgColor: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = BannerInfo
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // diffable datasource: presentation
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = self.bgColor[indexPath.item] // item (x)
            return cell
        })
        
        // snapshot: data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerList, toSection: .main)
        dataSource.apply(snapshot)
        
        // compositional layout: layout
        collectionView.collectionViewLayout = layout()
        if #available(iOS 17.4, *) {
            collectionView.bouncesVertically = false
        } else {
            // Fallback on earlier versions
        }
        
        pageControl.numberOfPages = bannerList.count
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // section에 구애받지 않고, horizental 로 layout 해
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        // 각 layout이 변경이 있을 때마다, layout 관련해서 변경된 속성들(데이터)을 확인할 수 있는 handler
        // visibleItemsInvalidationHandler 가 사용되는 방식
        // >> public typealias NSCollectionLayoutSectionVisibleItemsInvalidationHandler = ([any NSCollectionLayoutVisibleItem], CGPoint, any NSCollectionLayoutEnvironment) -> Void
        // NSCollectionLayoutEnvironment : 현재 container의 environment 정보를 갖고 있음
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int((offset.x / (env.container.contentSize.width * 0.9) ).rounded(.up))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
