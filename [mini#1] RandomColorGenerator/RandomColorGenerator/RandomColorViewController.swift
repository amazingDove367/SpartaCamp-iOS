//
//  RandomColorViewController.swift
//  RandomColorGenerator
//
//  Created by King J on 2/28/25.
//

import UIKit

class RandomColorViewController: UIViewController {
    
    private let bgColorView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let rgbLabel: UILabel = {
        let label = UILabel()
        label.text = "R: 255, G: 255, B: 255"
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let colorChangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Color", for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    @objc func changeColor() {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
        let redValue = Int(randomRed * 255)
        let greenValue = Int(randomGreen * 255)
        let blueValue = Int(randomBlue * 255)
        
        self.bgColorView.backgroundColor = randomColor
        self.rgbLabel.text = "R: \(Int(redValue)), G: \(Int(greenValue)), B: \(Int(blueValue))"
    }
    
    @objc func reset() {
        self.bgColorView.backgroundColor = .white
        self.rgbLabel.text = "R: 255, G: 255, B: 255"
    }
    
    private func setUI() {
        view.addSubview(bgColorView)
        bgColorView.addSubview(rgbLabel)
        bgColorView.addSubview(colorChangeButton)
        bgColorView.addSubview(resetButton)
        
        view.backgroundColor = .systemBackground
        bgColorView.backgroundColor = .systemBackground
    }
    
    private func setLayout() {
        bgColorView.translatesAutoresizingMaskIntoConstraints = false
        rgbLabel.translatesAutoresizingMaskIntoConstraints = false
        colorChangeButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            bgColorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            bgColorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            bgColorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bgColorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            rgbLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            rgbLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            colorChangeButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            colorChangeButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            resetButton.bottomAnchor.constraint(equalTo: colorChangeButton.bottomAnchor),
            resetButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])
    }
}
