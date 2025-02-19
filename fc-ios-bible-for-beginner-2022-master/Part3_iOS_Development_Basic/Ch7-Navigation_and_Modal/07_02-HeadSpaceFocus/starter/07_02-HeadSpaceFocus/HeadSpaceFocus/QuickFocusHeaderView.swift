//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 9/26/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var headerLable: UILabel!
    
    func configure(_ header: String) {
        headerLable.text = header
    }
}
