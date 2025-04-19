//
//  TableViewCell.swift
//  Practice_WeatherApp
//
//  Created by kingj on 4/18/25.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    private let dtTxtLable: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    
    private let tempLable: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    
    // TableView의 style, id로 초기화 할 때 사용하는 코드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    // Interface Builder를 통해 셀을 초기화 할 때 사용하는 코드
    // 여기서는 fatalError를 통해서 명시적으로 Interface Builder로 초기화 하지 않음을 나타냄
    // fatalError가 생기면, 앱이 종료되기 때문에, 이런 상황은 만들지 말라고 명시적으로 나타내고있음
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .black
        
        [
            dtTxtLable,
            tempLable
        ].forEach { contentView.addSubview($0) }
        
        dtTxtLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        tempLable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    public func configureCell(forcaseWeather: ForcastWeather) {
        self.dtTxtLable.text = forcaseWeather.dtTxt
        self.tempLable.text = "\(forcaseWeather.main.temp)℃"
    }
}
