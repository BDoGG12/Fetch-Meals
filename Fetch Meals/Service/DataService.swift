//
//  DataService.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/21/24.
//

import Foundation

class DataService {
    
    func makeInstructions(detail: MealsDetail?) -> String {
        return detail?.instructions.replacingOccurrences(of: "\r\n", with: "\n") ?? ""
    }
    
    func makeIngredientsAndMeasurements(detail: MealsDetail?) -> String {
        var ingredientsAndMeasurements: [String] = []
        
        for index in 1...20 {
            let ingredientKey = "ingredient\(index)"
            let measureKey = "measure\(index)"
            
            // Use Mirror to reflect on properties of Meal
            let mirror = Mirror(reflecting: detail!)
            
            let ingredientValue = mirror.children.first { $0.label == ingredientKey }?.value as? String ?? ""
            let measureValue = mirror.children.first { $0.label == measureKey }?.value as? String ?? ""
            
            if !ingredientValue.isEmpty && !measureValue.isEmpty {
                ingredientsAndMeasurements.append("\(ingredientValue): \(measureValue)")
            }
        }
        
        return ingredientsAndMeasurements.joined(separator: "\n")
    }
}
