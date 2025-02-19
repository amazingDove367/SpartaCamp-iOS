//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by Hakyung Sohn on 9/12/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var feedImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        feedImage.image = nil
    }
    
    func configure(_ image: String) {
        feedImage.image = UIImage(named: image)
    }
}
