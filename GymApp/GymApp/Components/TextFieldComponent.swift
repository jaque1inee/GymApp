//
//  TextFieldComponent.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 22/12/22.
//

import Foundation
import UIKit

public class TextFieldComponent: UIView {
    
    lazy var fullNameTextField: UITextField = {
        let fullNameTextField = UITextField()
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        fullNameTextField.backgroundColor = UIColor(hex: "F7F8F8")
        fullNameTextField.layer.cornerRadius = 14
        fullNameTextField.font = UIFont(name: "HelveticaNeue", size: 14)
        fullNameTextField.isUserInteractionEnabled = true
        return fullNameTextField
    }()
    
    init(placeholder: String, password: Bool) {
        super.init(frame: .zero)
        createViews()
        createConstraints()
 
        fullNameTextField.isSecureTextEntry = password
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .justified
        fullNameTextField.attributedPlaceholder = NSAttributedString (
            string: placeholder,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styleTextField(style: NumberFormatter) {
        
    }
    
    func setImage(image: UIImage) {
        
        let imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 18, height: 18))
        let image = image
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.addSubview(imageView)
        fullNameTextField.leftViewMode = .always
        fullNameTextField.leftView = view
    }
    
    func createViews() {
        addSubview(self.fullNameTextField)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.fullNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            self.fullNameTextField.topAnchor.constraint(equalTo: topAnchor),
            self.fullNameTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.fullNameTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}

