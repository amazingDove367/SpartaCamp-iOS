//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 9/26/24.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func configure(_ item: QuickFocus) {
        imageView.image = UIImage(named: item.imageName)
        titleLable.text = item.title
        descriptionLable.text = item.description
    }
}
