//
//  RegisterUserViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 22/12/22.
//

import UIKit
import FirebaseAuth

class RegisterUserViewController: UIViewController {
    
    var auth: Auth?
    
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
        createUserLabel.text = "Create an Account"
        
        return createUserLabel
    }()
    
    private lazy var fullNameTextField: TextFieldComponent = {
        let fullNameTextField = TextFieldComponent(placeholder: "Full Name", password: false)
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        return fullNameTextField
    }()
    
    private lazy var phoneNumberTextField: TextFieldComponent = {
        let phoneNumberTextField = TextFieldComponent(placeholder: "Phone Number", password: false)
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.isUserInteractionEnabled = true
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        phoneNumberTextField.styleTextField(style: formatter)
     
        return phoneNumberTextField
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
    
    private lazy var registerButton: CustomButtonComponent = {
        let registerButton = CustomButtonComponent(titleName: "Register")
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.delegate = self 
        
        return registerButton
    }()
    
    lazy var haveAccount: UILabel = {
        let haveAccount = UILabel()
        haveAccount.translatesAutoresizingMaskIntoConstraints = false
        haveAccount.text = "Already have an account?"
        haveAccount.font = UIFont(name: "HelveticaNeue", size: 14)
        
        return haveAccount
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton =  UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor(hex: "C58BF2"), for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        loginButton.addTarget(self, action: #selector(loginTouchPressed), for: .touchUpInside)
        return loginButton
    }()
    
    @objc private func loginTouchPressed() {
        let menuVC = LoginViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)

    }
    
    @objc private func registerTouchPressed() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        setupTextField()
        self.auth = Auth.auth()
        
    }
    
    func setupTextField() {
        guard let imageFullName = UIImage(named: "iconFullname") else { return }
        fullNameTextField.setImage(image: imageFullName)
        guard let iconPhoneNumber = UIImage(named: "iconPhoneNumber") else { return }
        phoneNumberTextField.setImage(image: iconPhoneNumber)
        guard let iconEmail = UIImage(named: "iconEmail") else { return }
        emailTextField.setImage(image: iconEmail)
        guard let iconPassword = UIImage(named: "iconPassword") else { return }
        passwordTextField.setImage(image: iconPassword)
    }
    
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.openingRegisterLabel)
        container.addSubview(self.createUserLabel)
        container.addSubview(self.fullNameTextField)
        container.addSubview(self.phoneNumberTextField)
        container.addSubview(self.emailTextField)
        container.addSubview(self.passwordTextField)
        container.addSubview(self.registerButton)
        container.addSubview(self.haveAccount)
        container.addSubview(self.loginButton)
    
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
            
            self.fullNameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.fullNameTextField.topAnchor.constraint(equalTo: createUserLabel.bottomAnchor, constant: 30),
            
            self.phoneNumberTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.phoneNumberTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.phoneNumberTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 15),
            
            self.emailTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.emailTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 15),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            
            self.registerButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 220),
            
            self.haveAccount.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 75),
            self.haveAccount.trailingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: -10),
            self.haveAccount.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 15),
            
            self.loginButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60),
            self.loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 15),
            self.loginButton.heightAnchor.constraint(equalToConstant: 18),
            
            

        ])
        
    }
}

extension RegisterUserViewController: CustomButtonDelegate {
    func tappedStartButton() {
//        Mudar viewController abaixo >>
        let menuVC = ConfirmationLoginViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
}
