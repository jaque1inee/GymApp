//
//  OnboardingViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 21/12/22.
//

import UIKit

class OnboardingThreeViewController: UIViewController {

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var onboardingThreeImage: UIImageView = {
        let onboardingOneImage = UIImageView()
        onboardingOneImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingOneImage.image = UIImage(named: "OnboardingThree")
        onboardingOneImage.contentMode = .scaleAspectFill
        return onboardingOneImage
        
    }()
    
    lazy var titleOnboardingThreeLabel: UILabel = {
        let titleOnboardingThreeLabel = UILabel()
        titleOnboardingThreeLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOnboardingThreeLabel.numberOfLines = 0
        titleOnboardingThreeLabel.textColor = UIColor(hex: "92A3FD")
//        logoLabel.font = UIFont(name: "Poppins-Bold", size: 36)
        titleOnboardingThreeLabel.font = UIFont(name:"HelveticaNeue-bold", size: 22)
        titleOnboardingThreeLabel.text = "Eat Well"
        
        return titleOnboardingThreeLabel
    }()
    
    lazy var textOnboardingThreeLabel: UILabel = {
        let textOnboardingThreeLabel = UILabel()
        textOnboardingThreeLabel.translatesAutoresizingMaskIntoConstraints = false
        textOnboardingThreeLabel.numberOfLines = 0
        textOnboardingThreeLabel.textColor = UIColor(hex: "7B6F72")
        textOnboardingThreeLabel.font = UIFont(name:"HelveticaNeue-light", size: 12)
        textOnboardingThreeLabel.text = "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"

        return textOnboardingThreeLabel
    }()
    
    lazy var nextOnboardingThreeButton: UIButton = {
        let nextOnboardingThreeButton = UIButton()
        nextOnboardingThreeButton.translatesAutoresizingMaskIntoConstraints = false
        nextOnboardingThreeButton.setTitle(">", for: .normal)
        nextOnboardingThreeButton.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        nextOnboardingThreeButton.backgroundColor = UIColor(hex: "95ADFE")
        nextOnboardingThreeButton.layer.cornerRadius = 30
        nextOnboardingThreeButton.clipsToBounds = true
        nextOnboardingThreeButton.addTarget(self, action: #selector(tappedStarted), for: .touchUpInside)
        return nextOnboardingThreeButton
    }()
    
    
    @objc private func tappedStarted() {
        let menuVC = RegisterUserViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.onboardingThreeImage)
        container.addSubview(self.titleOnboardingThreeLabel)
        container.addSubview(self.textOnboardingThreeLabel)
        container.addSubview(self.nextOnboardingThreeButton)
        
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            
            self.onboardingThreeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.onboardingThreeImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.onboardingThreeImage.topAnchor.constraint(equalTo: container.topAnchor),
            
            self.titleOnboardingThreeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.titleOnboardingThreeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.titleOnboardingThreeLabel.topAnchor.constraint(equalTo: onboardingThreeImage.bottomAnchor, constant: 64),
            
            self.textOnboardingThreeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.textOnboardingThreeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.textOnboardingThreeLabel.topAnchor.constraint(equalTo: titleOnboardingThreeLabel.bottomAnchor, constant: 30),
            
            self.nextOnboardingThreeButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.nextOnboardingThreeButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            self.nextOnboardingThreeButton.widthAnchor.constraint(equalToConstant: 60),
            self.nextOnboardingThreeButton.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            
            
            
            
        
        ])
        
    }

}
