//
//  MealsModel.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/17/24.
//

import Foundation

struct MealsDetail: Codable {
    var idMeal: String
    var meal: String
    var category: String
    var instructions: String
    var mealThumbnail: String
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String
    var ingredient4: String
    var ingredient5: String
    var ingredient6: String
    var ingredient7: String
    var ingredient8: String
    var ingredient9: String
    var ingredient10: String
    var ingredient11: String
    var ingredient12: String
    var ingredient13: String
    var ingredient14: String
    var ingredient15: String
    var ingredient16: String
    var ingredient17: String
    var ingredient18: String
    var ingredient19: String
    var ingredient20: String
    var measure1: String
    var measure2: String
    var measure3: String
    var measure4: String
    var measure5: String
    var measure6: String
    var measure7: String
    var measure8: String
    var measure9: String
    var measure10: String
    var measure11: String
    var measure12: String
    var measure13: String
    var measure14: String
    var measure15: String
    var measure16: String
    var measure17: String
    var measure18: String
    var measure19: String
    var measure20: String
    
    var id: String {
        idMeal
    }
    
}

struct MealsDetailResponse: Codable {
    var meals: [MealsDetail]
}
