//
//  ChatCollectionViewCell.swift
//  ChatList
//
//  Created by Hakyung Sohn on 9/11/24.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 10
        messageLable.numberOfLines = 2
    }
    
    func config(_ chat: Chat) {
        userImage.image = UIImage(named: chat.name)
        userName.text = chat.name
        messageLable.text = chat.chat
        dateLable.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        // string -> date
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "m/d"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
