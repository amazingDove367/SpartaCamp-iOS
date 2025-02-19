//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by Hakyung Sohn on 9/23/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus) {
        titleLable.text = item.title
        descriptionLable.text = item.description
        weatherImage.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}

