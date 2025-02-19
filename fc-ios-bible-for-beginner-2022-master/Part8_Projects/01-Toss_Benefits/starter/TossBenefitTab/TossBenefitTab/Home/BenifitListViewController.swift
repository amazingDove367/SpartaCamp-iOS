//
//  BenifitListViewController.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/15/24.
//

import UIKit

class BenifitListViewController: UIViewController {
    
    /// * 사용자 입장에서 기획 풀어내기 *
    /// - 사용자는 포인트를 볼 수 있다
    /// - 사용쟈는 오늘의 혜택을 볼 수 있다.
    /// - 사용자는 나머지 혜택 리스트를 볼 수 있다.
    ///
    /// - 사용자는 포인트 셀을 눌렀을 때, 포인트 상세뷰를 넘어간다.
    /// - 사용자는 혜택 (오늘/나머지) 셀을 눌렀을 때, 혜택 상세뷰를 넘어간다.
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AnyHashable 
    // Hashable: protocol type / AnyHashable: 구현체 타입
    // 실제 개발시; 하나의 타입만 설정해주는 것이 용이하지만, 2가지의 모델을 보여줘야하기 때문에 AnyHashable로
    
    enum Section: Int { // view 에서 보일 섹션
        case todays
        case other
    }

    var todaySectionItems: [AnyHashable] = TodaySectionItem(point: .default, benefit: .today).sectionItems // [포인트, 오늘의 혜택] // [MyPoint.default, Benefit.today] >> 하나로 묶어서. TodaySectionItem
    var otherSectionItems: [AnyHashable] = Benefit.others // [혜택 나머지 리스트]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionView()
    }
    
    private func setupUI() {
        navigationItem.title = "혜택"
    }
    
    private func configureCollectionView() {
        // presentation - cell (section-item binding)
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let section = Section(rawValue: indexPath.section) else { return nil }
            let cell = self.configureCell(for: section, item: item, collectionView: collectionView, indexPath: indexPath)
            return cell
        })
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.todays, .other])
        snapshot.appendItems(todaySectionItems, toSection: .todays)
        snapshot.appendItems(otherSectionItems, toSection: .other)
        dataSource.apply(snapshot)
        
        // layout
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureCell(for section: Section, item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell? {
        // 두가지 section 이 있기에, 색션마다 셀을 다르게
        switch section {
        case .todays: // 2개의 item
            if let point = item as? MyPoint { // item이 MyPoint type 일때
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPointCell", for: indexPath) as! MyPointCell
                cell.configure(item: point)
                return cell
            } else if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodaysBenefitCell", for: indexPath) as! TodaysBenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
            
        case .other:
            if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherBenefitCell", for: indexPath) as! OtherBenefitCell
                cell.configure(item: benefit)
                return cell
            } else {
                return nil
            }
        }
        return nil
    }
}

extension BenifitListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = dataSource.itemIdentifier(for: indexPath)
        
        if let mypoint = item as? MyPoint {
            let sb = UIStoryboard(name: "MyPoint", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MyPointViewController") as! MyPointViewController
            navigationController?.pushViewController(vc, animated: true)
        } else if let benefit = item as? Benefit {
            let sb = UIStoryboard(name: "ButtonBenefit", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ButtonBenefitViewController") as! ButtonBenefitViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
