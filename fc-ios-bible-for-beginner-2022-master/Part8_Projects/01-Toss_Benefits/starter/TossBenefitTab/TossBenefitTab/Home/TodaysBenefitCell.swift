//
//  TodaysBenefitCell.swift
//  TossBenefitTab
//
//  Created by Hakyung Sohn on 11/18/24.
//

import UIKit

class TodaysBenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        self.layer.cornerRadius = 10
    }
    
    func configure(item benefit: Benefit) {
        self.imageView.image = UIImage(systemName: benefit.imageName)?.withRenderingMode(.alwaysOriginal)
        self.title.text = benefit.title
        self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
    }
}
