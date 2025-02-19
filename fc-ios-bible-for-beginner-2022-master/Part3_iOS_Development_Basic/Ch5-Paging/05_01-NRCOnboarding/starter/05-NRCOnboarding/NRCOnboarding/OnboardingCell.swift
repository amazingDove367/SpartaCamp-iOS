//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by Hakyung Sohn on 9/13/24.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLable.text = message.title
        descriptionLable.text = message.description
    }
}
