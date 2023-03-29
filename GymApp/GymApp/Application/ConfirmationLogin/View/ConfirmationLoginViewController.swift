//
//  ConfirmationLoginViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 23/12/22.
//

import UIKit

class ConfirmationLoginViewController: UIViewController {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var confirmationImage: UIImageView = {
        let confirmationImage = UIImageView()
        confirmationImage.translatesAutoresizingMaskIntoConstraints = false
        confirmationImage.image = UIImage(named: "welcomeImage")
        confirmationImage.contentMode = .scaleAspectFit
        return confirmationImage
        
    }()
    
    lazy var welcomeUserLabel: UILabel = {
        let welcomeUserLabel = UILabel()
        welcomeUserLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeUserLabel.numberOfLines = 0
        welcomeUserLabel.textColor = UIColor(hex: "1D1617")
        welcomeUserLabel.font = UIFont(name:"HelveticaNeue-bold", size: 22)
        welcomeUserLabel.text = "Welcome, Usuário"
        welcomeUserLabel.textAlignment = .center
        
        return welcomeUserLabel
    }()
    
    lazy var subtitleWelcomeLabel: UILabel = {
        let subtitleWelcomeLabel = UILabel()
        subtitleWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleWelcomeLabel.numberOfLines = 0
        subtitleWelcomeLabel.textColor = UIColor(hex: "7B6F72")
        subtitleWelcomeLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        subtitleWelcomeLabel.text = "You are all set now, let’s reach your goals together with us"
        subtitleWelcomeLabel.textAlignment = .center
        
        return subtitleWelcomeLabel
    }()
    
    private lazy var goHomeButton: CustomButtonComponent = {
        let goHomeButton = CustomButtonComponent(titleName: "Go to Home")
        goHomeButton.translatesAutoresizingMaskIntoConstraints = false
        goHomeButton.delegate = self
        
        return goHomeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
    }
    
    func createViews() {
        view.addSubview(container)
        container.addSubview(confirmationImage)
        container.addSubview(welcomeUserLabel)
        container.addSubview(subtitleWelcomeLabel)
        container.addSubview(goHomeButton)
        
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            
            self.confirmationImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 48),
            self.confirmationImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -48),
            self.confirmationImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 102),
            
            self.welcomeUserLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30),
            self.welcomeUserLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30),
            self.welcomeUserLabel.topAnchor.constraint(equalTo: confirmationImage.bottomAnchor, constant: 44),
            
            self.subtitleWelcomeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 80),
            self.subtitleWelcomeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -80),
            self.subtitleWelcomeLabel.topAnchor.constraint(equalTo: welcomeUserLabel.bottomAnchor, constant: 8),
            
            self.goHomeButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.goHomeButton.leadingAnchor.constraint(equalTo:  container.leadingAnchor),
//            self.goHomeButton.topAnchor.constraint(equalTo: subtitleWelcomeLabel.bottomAnchor, constant: 120),
            self.goHomeButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
//            self.goHomeButton.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}

extension ConfirmationLoginViewController: CustomButtonDelegate {
    func tappedStartButton() {
        let menuVC = HomeViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    

}
