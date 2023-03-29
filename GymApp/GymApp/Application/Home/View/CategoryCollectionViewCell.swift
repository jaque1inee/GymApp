//
//  CategoryCollectionViewCell.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 26/12/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "B0C8FA")
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        categoryLabel.textAlignment = .center
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.textColor = UIColor(hex: "FFFFFF")
        categoryLabel.numberOfLines = 0
//        categoryLabel.text = "Category"
    
        return categoryLabel
        
    }()
    
    func setupViewCell(categoryResult: Category){
        createViews()
        createConstraints()
        categoryLabel.text = categoryResult.name
    }
    
    
    func createViews() {
        contentView.addSubview(container)
        container.addSubview(categoryLabel)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.widthAnchor.constraint(equalToConstant: 30),
            self.container.heightAnchor.constraint(equalToConstant: 30),
            
            self.categoryLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            self.categoryLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: -5),
            self.categoryLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            self.categoryLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)

        ])
    }
}
