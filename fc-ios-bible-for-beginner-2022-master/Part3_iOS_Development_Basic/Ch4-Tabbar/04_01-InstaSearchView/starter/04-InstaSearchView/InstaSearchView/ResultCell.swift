//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 9/12/24.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imgName: String) {
        thumbnailImageView.image = UIImage(named: imgName)
    }
}
