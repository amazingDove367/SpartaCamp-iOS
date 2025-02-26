//
//  CounterViewController.swift
//  [mini#2] CounterApp
//
//  Created by King Jesus on 2/26/25.
//

import UIKit

class CounterViewController: UIViewController {
    
    private var number: Int = 0
    
    private let numberLable: UILabel = {
        let lable = UILabel()
        lable.text = "0"
        lable.textColor = .label
        lable.font = .systemFont(ofSize: 130, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusNumber), for: .touchUpInside)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(minusNumber), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetNumber), for: .touchUpInside)
        return button
    }()
    
    private func buttonEnabled() {
        plusButton.isEnabled = number < 10
        minusButton.isEnabled = number > -10
    }
    
    @objc func plusNumber() {
        number += 1
        numberLable.text = "\(number)"
        buttonEnabled()
    }
    
    @objc func minusNumber() {
        number -= 1
        numberLable.text = "\(number)"
        buttonEnabled()
    }
    
    @objc func resetNumber() {
        number = 0
        numberLable.text = "\(number)"
        buttonEnabled()
    }
    
    private var hStack: UIStackView = {
        var hstack = UIStackView()
        hstack.axis = .horizontal
        hstack.distribution = .fillEqually
        hstack.alignment = .center
        hstack.spacing = 40
        hstack.translatesAutoresizingMaskIntoConstraints = false
        return hstack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        confitureAutoLayout()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(numberLable)
        
        configureHStack()
        view.addSubview(hStack)
    }
    
    private func confitureAutoLayout() {
        
        NSLayoutConstraint.activate([
            numberLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            numberLable.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            hStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            hStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            hStack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -6)
        ])
    }
    
    func configureHStack() {
        hStack.addArrangedSubview(plusButton)
        hStack.addArrangedSubview(resetButton)
        hStack.addArrangedSubview(minusButton)
    }
}
