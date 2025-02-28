//
//  CounterView.swift
//  [mini#2] CounterApp
//
//  Created by King J on 2/28/25.
//

import UIKit

class CounterView: UIView {
    
    private lazy var numberLable: UILabel = {
        let lable = UILabel()
        lable.text = "0"
        lable.textColor = .red
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var hStack: UIStackView = {
        var hstack = UIStackView()
        hstack.axis = .horizontal
        hstack.distribution = .fillEqually
        hstack.alignment = .center
        hstack.translatesAutoresizingMaskIntoConstraints = false
        return hstack
    }()

    func buttonsHStack() -> UIStackView {
        hStack.addArrangedSubview(plusButton)
        hStack.addArrangedSubview(resetButton)
        hStack.addArrangedSubview(minusButton)
        return hStack
    }
    
}
