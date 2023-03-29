//
//  ExerciseTableViewCell.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 26/12/22.
//

import UIKit

protocol DetailsButtonDelegate: AnyObject {
    
    func tappedStartButton(exercise: Exercise)
}

class ExerciseTableViewCell: UITableViewCell {
    
    weak var delegate: DetailsButtonDelegate?
    
    private var exercises: Exercise?
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "D1E1FF")
        view.layer.cornerRadius = 10
   
        return view
    }()
    
    private lazy var titleExerciseLabel: UILabel = {
        let titleExerciseLabel = UILabel()
        titleExerciseLabel.text = "titleExercise"
        titleExerciseLabel.font = UIFont(name:"HelveticaNeue-bold", size: 14)
        titleExerciseLabel.textAlignment = .left
        titleExerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        titleExerciseLabel.textColor = .white
        titleExerciseLabel.textColor = UIColor(hex: "1D1617")
        titleExerciseLabel.numberOfLines = 0
    
        return titleExerciseLabel
    }()
    
    lazy var backgroundImage: UIView = {
        let backgroundImage = UIView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.backgroundColor = .white
        backgroundImage.layer.cornerRadius = 60
        return backgroundImage
        
    }()
    
    private lazy var imageExercise: UIImageView = {
        let imageExercise =  UIImageView()
        imageExercise.translatesAutoresizingMaskIntoConstraints = false
        imageExercise.contentMode = .scaleAspectFit
//        imageExercise.backgroundColor = .white
        
        return imageExercise
    }()
    
   private lazy var detailsExerciseButton: UIButton = {
        let detailsExerciseButton = UIButton()
        detailsExerciseButton.translatesAutoresizingMaskIntoConstraints = false
        detailsExerciseButton.backgroundColor = .white
        detailsExerciseButton.setTitle("View more", for: .normal)
        detailsExerciseButton.setTitleColor(UIColor(hex: "92A3FD"), for: .normal)
        detailsExerciseButton.layer.cornerRadius = 15
        detailsExerciseButton.titleLabel?.font =  UIFont(name:"HelveticaNeue-bold", size: 12)
        detailsExerciseButton.addTarget(self, action: #selector(tappedStarted), for: .touchUpInside)
        return detailsExerciseButton
    }()
//
    @objc private func tappedStarted() {
        guard let exercise = exercises else { return }
        delegate?.tappedStartButton(exercise: exercise)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(resultsExercise: Exercise) {
        createViews()
        createConstraints()
        titleExerciseLabel.text = resultsExercise.name
        
        imageExercise.downloaded(from: resultsExercise.images?.first?.image ?? "")
        exercises = resultsExercise
        
 
    }
    
    func createViews() {
        contentView.addSubview(self.container)
        container.addSubview(self.titleExerciseLabel)
        container.addSubview(self.detailsExerciseButton)
        container.addSubview(self.backgroundImage)
        backgroundImage.addSubview(self.imageExercise)
    }
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            self.container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.container.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.container.heightAnchor.constraint(equalToConstant: 140),
            
            self.titleExerciseLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.titleExerciseLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),

            self.detailsExerciseButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.detailsExerciseButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            self.detailsExerciseButton.heightAnchor.constraint(equalToConstant: 35),
            self.detailsExerciseButton.widthAnchor.constraint(equalToConstant: 94),
            
            self.backgroundImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            self.backgroundImage.leadingAnchor.constraint(equalTo: titleExerciseLabel.trailingAnchor, constant: 50),
            self.backgroundImage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            self.backgroundImage.heightAnchor.constraint(equalToConstant: 120),
            self.backgroundImage.widthAnchor.constraint(equalToConstant: 120),
            
            self.imageExercise.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 5),
            self.imageExercise.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -5),
            self.imageExercise.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 5),
            self.imageExercise.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -5),

        ])
    }
}
