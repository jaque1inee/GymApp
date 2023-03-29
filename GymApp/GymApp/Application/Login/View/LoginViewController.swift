//
//  LoginViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 23/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var openingRegisterLabel: UILabel = {
        let openingRegisterLabel = UILabel()
        openingRegisterLabel.translatesAutoresizingMaskIntoConstraints = false
        openingRegisterLabel.numberOfLines = 0
        openingRegisterLabel.textColor = UIColor(hex: "1D1617")
        openingRegisterLabel.font = UIFont(name:"HelveticaNeue-ligth", size: 16 )
        openingRegisterLabel.text = "Hey there,"
        openingRegisterLabel.textAlignment = .center
        
        return openingRegisterLabel
    }()
    
    lazy var createUserLabel: UILabel = {
        let createUserLabel = UILabel()
        createUserLabel.translatesAutoresizingMaskIntoConstraints = false
        createUserLabel.numberOfLines = 0
        createUserLabel.textColor = UIColor(hex: "1D1617")
        createUserLabel.font = UIFont(name:"HelveticaNeue-bold", size: 20)
        createUserLabel.textAlignment = .center
        createUserLabel.text = "Welcome Back"
        
        return createUserLabel
    }()
    
    private lazy var emailTextField: TextFieldComponent = {
        let emailTextField = TextFieldComponent(placeholder: "Email", password: false)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private lazy var passwordTextField: TextFieldComponent = {
        let passwordTextField = TextFieldComponent(placeholder: "Password", password: true)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        return passwordTextField
    }()
    
    private lazy var loginButton: CustomButtonComponent = {
        let loginButton = CustomButtonComponent(titleName: "Login")
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.delegate = self
        
        return loginButton
    }()
    
    lazy var haveAccount: UILabel = {
        let haveAccount = UILabel()
        haveAccount.translatesAutoresizingMaskIntoConstraints = false
        haveAccount.text = "Don’t have an account yet?"
        haveAccount.font = UIFont(name: "HelveticaNeue", size: 14)
        
        return haveAccount
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton =  UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor(hex: "C58BF2"), for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        registerButton.addTarget(self, action: #selector(registerTouchPressed), for: .touchUpInside)
        return registerButton
    }()
    
    lazy var forgotPassword: UIButton = {
        let forgotPassword =  UIButton()
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
//        forgotPassword.setTitle("Forgot your password?", for: .normal)
        forgotPassword.setTitleColor(UIColor(hex: "ADA4A5"), for: .normal)
        forgotPassword.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        let attributeString = NSMutableAttributedString(
                string: "Forgot your password?",
                attributes: yourAttributes
              )
        forgotPassword.setAttributedTitle(attributeString, for: .normal)
//        forgotPassword.addTarget(self, action: #selector(registerTouchPressed), for: .touchUpInside)
        return forgotPassword
    }()

    @objc private func registerTouchPressed() {
        let menuVC = RegisterUserViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        setupTextField()
 
    }
    
    func setupTextField() {
        guard let iconEmail = UIImage(named: "iconEmail") else { return }
        emailTextField.setImage(image: iconEmail)
        guard let iconPassword = UIImage(named: "iconPassword") else { return }
        passwordTextField.setImage(image: iconPassword)
    }
    
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.openingRegisterLabel)
        container.addSubview(self.createUserLabel)
        container.addSubview(self.emailTextField)
        container.addSubview(self.passwordTextField)
        container.addSubview(self.forgotPassword)
        container.addSubview(self.loginButton)
        container.addSubview(self.haveAccount)
        container.addSubview(self.registerButton)
    
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            self.openingRegisterLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 130),
            self.openingRegisterLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -130),
            self.openingRegisterLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 120),
            
           
            self.createUserLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40),
            self.createUserLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40),
            self.createUserLabel.topAnchor.constraint(equalTo: openingRegisterLabel.bottomAnchor, constant: 5),
            
            self.emailTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.emailTextField.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: 15),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            
            self.forgotPassword.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 118),
            self.forgotPassword.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -118),
            self.forgotPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            
            self.loginButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.loginButton.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 220),
            
            self.haveAccount.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 75),
            self.haveAccount.trailingAnchor.constraint(equalTo: registerButton.leadingAnchor, constant: -10),
            self.haveAccount.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            
            self.registerButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60),
            self.registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            self.registerButton.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}

extension LoginViewController: CustomButtonDelegate {
    func tappedStartButton() {
        let menuVC = ConfirmationLoginViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
}

