//
//  WelcomeScreenViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 21/12/22.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var logoLabel: UILabel = {
        let logoLabel = UILabel()
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.numberOfLines = 0
        logoLabel.textColor = UIColor(hex: "92A3FD")
//        logoLabel.font = UIFont(name: "Poppins-Bold", size: 36)
        logoLabel.font = UIFont(name:"HelveticaNeue-bold", size: 36)
        logoLabel.text = "GymApp"
        
        return logoLabel
    }()
    
    lazy var openingLabel: UILabel = {
        let openingLabel = UILabel()
        openingLabel.translatesAutoresizingMaskIntoConstraints = false
        openingLabel.numberOfLines = 0
        openingLabel.textColor = UIColor(hex: "7B6F72")
        openingLabel.font = UIFont(name:"HelveticaNeue-light", size: 14)
//        openingLabel.font = UIFont(name: "Poppins-Bold", size: 18)
        openingLabel.text = "Everybody Can Train"
        
        return openingLabel
    }()
    
    lazy var getStartedButton: UIButton = {
        let getStartedButton = UIButton()
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        getStartedButton.backgroundColor = UIColor(hex: "95ADFE")
        getStartedButton.layer.cornerRadius = 24
        getStartedButton.addTarget(self, action: #selector(tappedStarted), for: .touchUpInside)
        return getStartedButton
    }()
    
    
    @objc private func tappedStarted() {
        let menuVC = OnboardingOneViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
    }
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(logoLabel)
        container.addSubview(openingLabel)
        container.addSubview(getStartedButton)
    
    }
    func createConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
//           self.logoLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
            self.logoLabel.bottomAnchor.constraint(equalTo: openingLabel.topAnchor, constant: -5),
            self.logoLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            self.openingLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.openingLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            self.getStartedButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.getStartedButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.getStartedButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            self.getStartedButton.widthAnchor.constraint(equalToConstant: 315),
            self.getStartedButton.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            
        
        ])
    }
    
}
