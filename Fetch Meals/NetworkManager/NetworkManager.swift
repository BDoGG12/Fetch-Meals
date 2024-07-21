//
//  NetworkManager.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/18/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    //MARK: - Fetch meals
    func fetchMeals() async throws -> [Meals] {
        
        let urlStr = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: urlStr) else {
            throw URLError(.badURL)
        }
        
        // Get Request
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let mealsRes = try JSONDecoder().decode(MealsResponse.self, from: data)
        
        return mealsRes.meals
    }
    
    //MARK: - Fetch meal details
    func fetchMealDetails(id: String) async throws -> [MealsDetail] {
        let urlStr = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        let url = URL(string: urlStr)
        
        // Get Request
        let (data, _) = try await URLSession.shared.data(from: url!)
        
        let mealsRes = try JSONDecoder().decode(MealsDetailResponse.self, from: data)
        print("Meals Response: \(mealsRes)")
        
        return mealsRes.meals
    }
}
