//
//  ExerciseDetailsViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 28/12/22.
//

import UIKit

class ExerciseDetailsViewController: UIViewController {
    
    var exercise: Exercise?
    
    var images: ImageExercise?
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "92A3FD")
        return view
    }()
    
    lazy var backButton: UIButton = {
        let backButton =  UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.backgroundColor = .white
        backButton.setTitleColor(.gray, for: .normal)
        backButton.setTitle("<", for: .normal)
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(backHomeButton), for: .touchUpInside)

        return backButton
        
    }()
    
    lazy var backgroundImage: UIView = {
        let backgroundImage = UIView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.backgroundColor = UIColor(hex: "FFFFFF")
        backgroundImage.layer.cornerRadius = 140
        backgroundImage.layer.masksToBounds = true
        
        return backgroundImage
        
    }()
    
    lazy var imageExercise: UIImageView = {
        let imageExercise =  UIImageView()
        imageExercise.translatesAutoresizingMaskIntoConstraints = false
        
//        imageExercise.backgroundColor = .white
        return imageExercise
    }()
    
    lazy var bottomBackground: UIView = {
        let bottomBackground = UIView()
        bottomBackground.translatesAutoresizingMaskIntoConstraints = false
        bottomBackground.backgroundColor = .white
        bottomBackground.layer.cornerRadius = 10
        bottomBackground.layer.masksToBounds = true
        
        return bottomBackground
    }()
    
    
    
    lazy var titleExercise: UILabel = {
        let titleExercise = UILabel()
        titleExercise.translatesAutoresizingMaskIntoConstraints = false
        titleExercise.font = UIFont(name: "HelveticaNeue", size: 14)
        titleExercise.textAlignment = .left
        titleExercise.textColor = .black
        titleExercise.numberOfLines = 0
        return titleExercise
        
    }()
    
    
    lazy var categoryExercise: UILabel = {
        let categoryExercise = UILabel()
        categoryExercise.translatesAutoresizingMaskIntoConstraints = false
        categoryExercise.font = UIFont(name: "HelveticaNeue", size: 14)
        categoryExercise.textAlignment = .left
        categoryExercise.textColor = .black
        categoryExercise.numberOfLines = 0
        return categoryExercise
        
    }()
    
    lazy var descriptionExercise: UILabel = {
        let descriptionExercise = UILabel()
        descriptionExercise.translatesAutoresizingMaskIntoConstraints = false
        descriptionExercise.numberOfLines = 0
        descriptionExercise.textAlignment = .justified
        descriptionExercise.textColor = .black
        descriptionExercise.font = UIFont(name: "HelveticaNeue", size: 14)

        return descriptionExercise
    }()
    
    @objc func backHomeButton() {
        let menuVC =  HomeViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        titleExercise.text = exercise?.name
        descriptionExercise.text = exercise?.description
//        categoryExercise.text =  exercise?.category?.name
        categoryExercise.text =  exercise?.muscles?.first?.name
        
        imageExercise.downloaded(from: exercise?.images?.first?.image ?? "")
//                                    resultsExercise.images?.first?.image ?? "")
    }
    
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.backButton)
        container.addSubview(self.backgroundImage)
        backgroundImage.addSubview(self.imageExercise)
        container.addSubview(self.bottomBackground)
        bottomBackground.addSubview(self.titleExercise)
        bottomBackground.addSubview(self.categoryExercise)
        bottomBackground.addSubview(self.descriptionExercise)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.backButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.backButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 60),
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            
//            self.backgroundImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
//            self.backgroundImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.backgroundImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.backgroundImage.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 80),
            self.backgroundImage.heightAnchor.constraint(equalToConstant: 288),
            self.backgroundImage.widthAnchor.constraint(equalToConstant: 288),
            
            self.imageExercise.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 10),
            self.imageExercise.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -10),
            self.imageExercise.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 10),
            self.imageExercise.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -10),
            
            self.bottomBackground.topAnchor.constraint(equalTo: imageExercise.bottomAnchor, constant: 40),
            self.bottomBackground.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.bottomBackground.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.bottomBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor),
//            self.scrollViewDetails.heightAnchor.constraint(equalToConstant: 2200),
            
            
            self.titleExercise.leadingAnchor.constraint(equalTo: bottomBackground.leadingAnchor, constant: 20),
            self.titleExercise.trailingAnchor.constraint(equalTo: bottomBackground.trailingAnchor, constant: -20),
            self.titleExercise.topAnchor.constraint(equalTo: bottomBackground.topAnchor, constant: 10),
            
            self.categoryExercise.leadingAnchor.constraint(equalTo: bottomBackground.leadingAnchor, constant: 20),
            self.categoryExercise.trailingAnchor.constraint(equalTo: bottomBackground.trailingAnchor, constant: -20),
            self.categoryExercise.topAnchor.constraint(equalTo: titleExercise.bottomAnchor, constant: 20),
            
            self.descriptionExercise.leadingAnchor.constraint(equalTo: bottomBackground.leadingAnchor, constant: 20),
            self.descriptionExercise.trailingAnchor.constraint(equalTo: bottomBackground.trailingAnchor, constant: -20),
            self.descriptionExercise.topAnchor.constraint(equalTo: categoryExercise.bottomAnchor, constant: 20)

        ])
    }
}
