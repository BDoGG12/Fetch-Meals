//
//  Meals.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/17/24.
//

import Foundation

struct Meals: Codable, Identifiable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
    
    var id: String {
        idMeal
    }
}

struct MealsResponse: Codable {
    var meals: [Meals]
}
