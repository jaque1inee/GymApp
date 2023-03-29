//
//  OnboardingViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 21/12/22.
//

import UIKit

class OnboardingTwoViewController: UIViewController {

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var onboardingOneImage: UIImageView = {
        let onboardingOneImage = UIImageView()
        onboardingOneImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingOneImage.image = UIImage(named: "OnboardingTwo")
        onboardingOneImage.contentMode = .scaleAspectFill
        return onboardingOneImage
        
    }()
    
    lazy var titleOnboardingTwoLabel: UILabel = {
        let titleOnboardingTwoLabel = UILabel()
        titleOnboardingTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOnboardingTwoLabel.numberOfLines = 0
        titleOnboardingTwoLabel.textColor = UIColor(hex: "92A3FD")
        titleOnboardingTwoLabel.font = UIFont(name:"HelveticaNeue-bold", size: 22)
        titleOnboardingTwoLabel.text = "Get Burn"
        
        return titleOnboardingTwoLabel
    }()
    
    lazy var textOnboardingTwoLabel: UILabel = {
        let textOnboardingTwoLabel = UILabel()
        textOnboardingTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        textOnboardingTwoLabel.numberOfLines = 0
        textOnboardingTwoLabel.textColor = UIColor(hex: "7B6F72")
        textOnboardingTwoLabel.font = UIFont(name:"HelveticaNeue-light", size: 12)

        textOnboardingTwoLabel.text = "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"
        
        return textOnboardingTwoLabel
    }()
    
    lazy var nextOnboardingTwoButton: UIButton = {
        let nextOnboardingTwoButton = UIButton()
        nextOnboardingTwoButton.translatesAutoresizingMaskIntoConstraints = false
        nextOnboardingTwoButton.setTitle(">", for: .normal)
        nextOnboardingTwoButton.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        nextOnboardingTwoButton.backgroundColor = UIColor(hex: "95ADFE")
        nextOnboardingTwoButton.layer.cornerRadius = 30
        nextOnboardingTwoButton.clipsToBounds = true
        nextOnboardingTwoButton.addTarget(self, action: #selector(tappedStarted), for: .touchUpInside)
        return nextOnboardingTwoButton
    }()
    
    
    @objc private func tappedStarted() {
        let menuVC = OnboardingThreeViewController()
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
        container.addSubview(self.onboardingOneImage)
        container.addSubview(self.titleOnboardingTwoLabel)
        container.addSubview(self.textOnboardingTwoLabel)
        container.addSubview(self.nextOnboardingTwoButton)
        
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            
            self.onboardingOneImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.onboardingOneImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.onboardingOneImage.topAnchor.constraint(equalTo: container.topAnchor),
            
            self.titleOnboardingTwoLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.titleOnboardingTwoLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.titleOnboardingTwoLabel.topAnchor.constraint(equalTo: onboardingOneImage.bottomAnchor, constant: 64),
            
            self.textOnboardingTwoLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.textOnboardingTwoLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.textOnboardingTwoLabel.topAnchor.constraint(equalTo: titleOnboardingTwoLabel.bottomAnchor, constant: 30),
            
            self.nextOnboardingTwoButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.nextOnboardingTwoButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            self.nextOnboardingTwoButton.widthAnchor.constraint(equalToConstant: 60),
            self.nextOnboardingTwoButton.heightAnchor.constraint(equalToConstant: 60),
 
        ])
        
    }

}
