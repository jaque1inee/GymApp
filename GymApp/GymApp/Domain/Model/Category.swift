//
//  Category.swift
//  GymApp
//
//  Created by Jaqueline Oliveira on 27/12/22.
//

import Foundation
import UIKit

struct CategoryResult: Decodable {
    var results: [Category] = []
}

struct Category: Decodable {
    var id: Int?
    var name: String?
}
