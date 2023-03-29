//
//  HomeExercisePresenter.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 26/12/22.
//

import Foundation
import UIKit
import Alamofire

protocol HomePresenterDelegate: AnyObject {
    func didSuccessExerciseList(results: ExerciseResult)
    func didFailureExerciseList(error: String)
    func didSuccessCategory(results: CategoryResult)
    func didFailureCategory(error: String)
    func didRequestCompleted()

}


class HomePresenter {
    weak var delegate: HomePresenterDelegate?
    let group = DispatchGroup()
    var page = 0
    var nextPageUrl = "https://wger.de/api/v2/exerciseinfo?limit=20&offset="
    func getExerciseList() {
        
        group.enter()
        
        
        AF.request("\(nextPageUrl)\(page)", method: .get).response { [self] response in
            switch response.result {
            case .success:
                do {
                    let results: ExerciseResult = try JSONDecoder().decode(ExerciseResult.self, from: response.data ?? Data())
                  
                    self.delegate?.didSuccessExerciseList(results: results)
                    self.group.leave()
                    
                } catch {
                    self.delegate?.didFailureExerciseList(error: "Algo deu errado!")
                    self.group.leave()
                    
                }
            case .failure(_):

                self.delegate?.didFailureExerciseList(error: "Algo deu errado!")
                self.group.leave()
              
            }
        }
        
        getCategory()
        group.notify(queue: DispatchQueue.main) {
            self.delegate?.didRequestCompleted()
        }
    }
    func getCategory() {
        
        AF.request("https://wger.de/api/v2/exercisecategory", method: .get).response { [self] response in
            switch response.result {
            case .success:
                do {
                    let results: CategoryResult = try JSONDecoder().decode(CategoryResult.self, from: response.data ?? Data())
                  
                    self.delegate?.didSuccessCategory(results: results)
                    
                } catch {
                    self.delegate?.didFailureCategory(error: "Algo deu errado!")
                    
                }
            case .failure(_):

                self.delegate?.didFailureCategory(error: "Algo deu errado!")
              
            }
        }
    }
}
//        getGenreList()
//        group.notify(queue: DispatchQueue.main) {
//            self.delegate?.didRequestCompleted()
//        }
//    }
    
//    func getGenreList () {
//        AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=f321a808e68611f41312aa8408531476", method: .get) .response
//        { response in
//            switch response.result {
//            case .success:
//                do {
//                    let resultsgenres : GenreMovie = try JSONDecoder().decode(GenreMovie.self, from: response.data ?? Data())
//                    self.delegate?.didSuccessGenreList(results: resultsgenres)
//
//                } catch {
//                    self.delegate?.didFailureGenreList(error: "Algo deu errado!")
//                }
//            case .failure(_):
//                self.delegate?.didFailureGenreList(error: "Algo deu errado")
//            }
//        }
//    }

