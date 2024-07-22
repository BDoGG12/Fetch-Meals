//
//  MockNetworkManager.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/22/24.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    
    var fetchMealsResult: Result<[Meals], Error>!
    var fetchMealsDetailsResult: Result<[MealsDetail], Error>!
    
    func fetchMeals() async throws -> [Meals] {
        switch fetchMealsResult {
        case .success(let meals):
            return meals
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchMealsResult not set")
        }
    }
    
    func fetchMealDetails(id: String) async throws -> [MealsDetail] {
        switch fetchMealsDetailsResult {
        case .success(let mealsDetails):
            return mealsDetails
        case .failure(let error):
            throw error
        case .none:
            fatalError("fetchMealsDetailsResult not set")
        }
    }
}
