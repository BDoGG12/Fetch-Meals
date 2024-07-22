//
//  DataService.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/21/24.
//

import Foundation

class DataService {
    
    func makeInstructions(detailInstructions: String) -> String {
        return detailInstructions.replacingOccurrences(of: "\r\n", with: "\n") 
    }
    
    func makeIngredientsAndMeasurements(detail: MealsDetail?) -> String {
        var ingredientsAndMeasurements: [String] = []
        
        for index in 1...20 {
            let ingredientKey = "ingredient\(index)"
            let measureKey = "measure\(index)"
            
            let defaultValue = MealsDetail(idMeal: "", meal: "", category: "", instructions: "", mealThumbnail: "", ingredient1: "", ingredient2: "", ingredient3: "", ingredient4: "", ingredient5: "", ingredient6: "", ingredient7: "", ingredient8: "", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: "")
            
            // Use Mirror to reflect on properties of Meal
            let mirror = Mirror(reflecting: detail ?? defaultValue)
            
            let ingredientValue = mirror.children.first { $0.label == ingredientKey }?.value as? String ?? ""
            let measureValue = mirror.children.first { $0.label == measureKey }?.value as? String ?? ""
            
            if !ingredientValue.isEmpty && !measureValue.isEmpty {
                ingredientsAndMeasurements.append("\(ingredientValue): \(measureValue)")
            }
        }
        
        return ingredientsAndMeasurements.joined(separator: "\n")
    }
}
