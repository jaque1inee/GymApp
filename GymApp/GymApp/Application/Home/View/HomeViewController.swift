//
//  HomeViewController.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 24/12/22.
//

import UIKit

class HomeViewController: UIViewController{
    
    var presenter: HomePresenter = HomePresenter()
    var exercises = ExerciseResult()
    var category = CategoryResult()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var userLabel: UILabel = {
        let userHomeLabel = UILabel()
        userHomeLabel.translatesAutoresizingMaskIntoConstraints = false
        userHomeLabel.numberOfLines = 0
        userHomeLabel.textColor = UIColor(hex: "1D1617")
        userHomeLabel.font = UIFont(name:"HelveticaNeue-bold", size: 18)
        userHomeLabel.text = "Welcome, Usuário"
        userHomeLabel.textAlignment = .left
        
        return userHomeLabel
        
    }()
    
    lazy var imageUser: UIImageView = {
        let imageUser = UIImageView()
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        imageUser.layer.cornerRadius = 30
        imageUser.layer.masksToBounds = true
        imageUser.backgroundColor = .lightGray
        
        return imageUser
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x:0, y:0, width: (UIScreen.main.bounds.width), height: 100))
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //        searchBar.searchBarStyle = UISearchBar.Style.prominent
       
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        //        searchBar.delegate = self
        
        return searchBar
    }()
    
    lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 30)
        let categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        
        return categoryCollectionView
    }()
    
    lazy var exerciseTableView: UITableView = {
        let exerciseTableView = UITableView(frame: .zero)
        exerciseTableView.translatesAutoresizingMaskIntoConstraints = false
        exerciseTableView.showsVerticalScrollIndicator = false
        exerciseTableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: "ExerciseTableViewCell")
        exerciseTableView.backgroundColor = .white
        exerciseTableView.sectionHeaderTopPadding = 0
           
        return exerciseTableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        return activityIndicator
    }()
//
//    @objc private func tappedStarted() {
//        let menuVC = ExerciseDetailsViewController()
////        menuVC.exercises.results[indexPath.section]
//        self.navigationController?.pushViewController(menuVC, animated: true)
//    }
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        createConstraints()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        exerciseTableView.delegate = self
        exerciseTableView.dataSource = self
        presenter.delegate = self
        activityIndicator.startAnimating()
        presenter.getExerciseList()
        presenter.getCategory()
        
    }
 
    func createViews() {
        view.addSubview(self.container)
        container.addSubview(self.userLabel)
        container.addSubview(self.imageUser)
        container.addSubview(self.searchBar)
        container.addSubview(self.categoryCollectionView)
        container.addSubview(self.exerciseTableView)
        container.addSubview(self.activityIndicator)
        
    }
    
    func createConstraints(){
        NSLayoutConstraint.activate([
            
            self.container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.container.topAnchor.constraint(equalTo: view.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.userLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.userLabel.trailingAnchor.constraint(equalTo: imageUser.leadingAnchor, constant: -10),
            self.userLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 100),
            
            //            self.imageUser.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor, constant: 20),
            self.imageUser.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.imageUser.topAnchor.constraint(equalTo: container.topAnchor, constant: 80),
            self.imageUser.heightAnchor.constraint(equalToConstant: 60),
            self.imageUser.widthAnchor.constraint(equalToConstant: 60),
            
            self.searchBar.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.searchBar.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.searchBar.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 40),
            self.searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            self.categoryCollectionView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.categoryCollectionView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.categoryCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            self.categoryCollectionView.heightAnchor.constraint(equalToConstant: 36),
            
            self.exerciseTableView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            self.exerciseTableView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            self.exerciseTableView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 15),
            self.exerciseTableView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            
            self.activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)


        ])
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.category.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
        
        let resultados = self.category.results[indexPath.row]
        cell.setupViewCell(categoryResult: resultados)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.exercises.results.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseTableViewCell", for: indexPath) as? ExerciseTableViewCell else {return UITableViewCell()}
        
        let resultados = self.exercises.results [indexPath.section]
        cell.setupCell(resultsExercise: resultados)
        cell.delegate = self
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

//        if exercises.next != presenter.nextPageUrl {
//            if indexPath.item == exercises.results.count - 1 {
//                presenter.page += 1
//                presenter.getExerciseList()
//                activityIndicator.startAnimating()
//            }
//
//        }
        
        if exercises.next != presenter.nextPageUrl {
            presenter.page += 1
            presenter.getExerciseList()
            activityIndicator.startAnimating()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
}

extension HomeViewController: HomePresenterDelegate {
   
    func didSuccessExerciseList(results: ExerciseResult) {
        if(presenter.page > 1) {
            exercises.results += results.results
            return
        }
        self.exercises = results
    }
    
    func didFailureExerciseList(error: String) {
        activityIndicator.isHidden = true
        print("error")
    }
    
    func didSuccessCategory(results: CategoryResult) {
        self.category = results
        self.categoryCollectionView.reloadData()
    }
    
    func didFailureCategory(error: String) {
        print("error")
    }
    
    func didRequestCompleted() {
        self.exerciseTableView.reloadData()
        activityIndicator.stopAnimating()
    }
}

extension HomeViewController: DetailsButtonDelegate {
    func tappedStartButton(exercise: Exercise) {
        let menuVC = ExerciseDetailsViewController()
        menuVC.exercise = exercise
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
}
