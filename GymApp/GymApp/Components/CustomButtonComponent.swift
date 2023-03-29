//
//  baseButton.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 22/12/22.
//

import Foundation
import UIKit

protocol CustomButtonDelegate: AnyObject {
    
    func tappedStartButton()
}

public class CustomButtonComponent: UIButton {
    
    weak var delegate: CustomButtonDelegate?
    
    lazy var baseButton: UIButton = {
        let baseButton = UIButton()
        baseButton.translatesAutoresizingMaskIntoConstraints = false
        baseButton.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        baseButton.backgroundColor = UIColor(hex: "95ADFE")
        baseButton.layer.cornerRadius = 30
        baseButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return baseButton
    }()
    
    init(titleName: String) {
        super.init(frame: .zero)
        createViews()
        createConstraints()
        baseButton.setTitle(titleName, for: .normal)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addTitle(setTitle: UIButton) {
        baseButton.setTitle("", for: .normal)
    }
    
    @objc
    func buttonTapped () {
        delegate?.tappedStartButton()
    }

    
    func createViews() {
        addSubview(self.baseButton)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.baseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            self.baseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            self.baseButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.baseButton.topAnchor.constraint(equalTo: topAnchor),
            self.baseButton.widthAnchor.constraint(equalToConstant: 315),
            self.baseButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}


