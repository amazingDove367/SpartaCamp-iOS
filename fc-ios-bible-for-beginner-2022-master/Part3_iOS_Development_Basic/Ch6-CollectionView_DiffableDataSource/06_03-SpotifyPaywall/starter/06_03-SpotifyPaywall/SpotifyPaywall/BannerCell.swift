//
//  BannerCell.swift
//  SpotifyPaywall
//
//  Created by joonwon lee on 2022/04/30.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    override func awakeFromNib() { // storyboard에서 깨어났을 때
        super.awakeFromNib()
        self.layer.cornerRadius = 16
    }
    
    func configure(_ item: BannerInfo) {
        titleLable.text = item.title
        descriptionLable.text = item.description
        thumbnailImage.image = UIImage(named: item.imageName)
    }
}
