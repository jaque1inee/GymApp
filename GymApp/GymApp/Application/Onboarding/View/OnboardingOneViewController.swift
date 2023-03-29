//
//  OnboardingViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 21/12/22.
//

import UIKit

class OnboardingOneViewController: UIViewController {

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var onboardingOneImage: UIImageView = {
        let onboardingOneImage = UIImageView()
        onboardingOneImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingOneImage.image = UIImage(named: "OnboardingOne")
        onboardingOneImage.contentMode = .scaleAspectFill
        return onboardingOneImage
        
    }()
    
    lazy var titleOnboardingOneLabel: UILabel = {
        let titleOnboardingLabel = UILabel()
        titleOnboardingLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOnboardingLabel.numberOfLines = 0
        titleOnboardingLabel.textColor = UIColor(hex: "92A3FD")
//        logoLabel.font = UIFont(name: "Poppins-Bold", size: 36)
        titleOnboardingLabel.font = UIFont(name:"HelveticaNeue-bold", size: 22)
        titleOnboardingLabel.text = "Track Your Goal"
        
        return titleOnboardingLabel
    }()
    
    lazy var textOnboardingOneLabel: UILabel = {
        let openingLabel = UILabel()
        openingLabel.translatesAutoresizingMaskIntoConstraints = false
        openingLabel.numberOfLines = 0
        openingLabel.textColor = UIColor(hex: "7B6F72")
        openingLabel.font = UIFont(name:"HelveticaNeue-light", size: 12)

        openingLabel.text = "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"
        
        return openingLabel
    }()
    
    lazy var nextOnboardingOneButton: UIButton = {
        let nextOnboardingOneButton = UIButton()
        nextOnboardingOneButton.translatesAutoresizingMaskIntoConstraints = false
        nextOnboardingOneButton.setTitle(">", for: .normal)
        nextOnboardingOneButton.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        nextOnboardingOneButton.backgroundColor = UIColor(hex: "95ADFE")
        nextOnboardingOneButton.layer.cornerRadius = 30
        nextOnboardingOneButton.clipsToBounds = true
        nextOnboardingOneButton.addTarget(self, action: #selector(tappedStarted), for: .touchUpInside)
        return nextOnboardingOneButton
    }()
    
    
    @objc private func tappedStarted() {
        let menuVC = OnboardingTwoViewController()
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
        container.addSubview(self.titleOnboardingOneLabel)
        container.addSubview(self.textOnboardingOneLabel)
        container.addSubview(self.nextOnboardingOneButton)
        
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
            
            self.titleOnboardingOneLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.titleOnboardingOneLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.titleOnboardingOneLabel.topAnchor.constraint(equalTo: onboardingOneImage.bottomAnchor, constant: 64),
            
            self.textOnboardingOneLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.textOnboardingOneLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.textOnboardingOneLabel.topAnchor.constraint(equalTo: titleOnboardingOneLabel.bottomAnchor, constant: 30),
            
            self.nextOnboardingOneButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.nextOnboardingOneButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            self.nextOnboardingOneButton.widthAnchor.constraint(equalToConstant: 60),
            self.nextOnboardingOneButton.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            
            
            
            
        
        ])
        
    }

}
