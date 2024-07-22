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
        
        let mirror = Mirror(reflecting: detail!)
        
        for index in 1...20 {
            if let ingredient = mirror.children.first(where: { $0.label == "strIngredient\(index)" })?.value as? String, let measure = mirror.children.first(where: { $0.label == "strMeasure\(index)" })?.value as? String, !ingredient.isEmpty, !measure.isEmpty {
                ingredientsAndMeasurements.append("\(ingredient): \(measure)")
            }
        }
        return ingredientsAndMeasurements.joined(separator: "\n")
    }
}
