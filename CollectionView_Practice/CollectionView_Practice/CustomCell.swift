//
//  CustomCell.swift
//  CollectionView_Practice
//
//  Created by kingj on 4/15/25.
//

import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    let label = UILabel()
    
    func configure() {
        self.contentView.addSubview(label)
        
        label.snp.makeConstraints {
        }
    }
}
