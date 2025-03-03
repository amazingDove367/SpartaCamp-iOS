//
//  MemoCell.swift
//  [mini#3] MemoApp
//
//  Created by King J on 2/28/25.
//

import UIKit

class MemoCell: UITableViewCell {
    
    static let identifier = "MemoCell"
    
    private let memoLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .label
        lable.font = .systemFont(ofSize: 20, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAutoLayout() {
        // viewcontroll 와 같이 view 가 아님! -> contentView
        contentView.addSubview(memoLable)
        memoLable.numberOfLines = 2
        memoLable.lineBreakMode = .byTruncatingTail
        
        NSLayoutConstraint.activate([
            memoLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            memoLable.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor),
            memoLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            memoLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
        ])
    }
    
    func configureCell(memoData: String) {
        memoLable.text = memoData
    }
}
