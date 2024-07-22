//
//  MockNetworkManager.swift
//  Fetch MealsTests
//
//  Created by Ben Do on 7/22/24.
//

import Foundation
@testable import Fetch_Meals

class MockNetworkManager: NetworkManagerProtocol {
    
    
    var shouldReturnError = false
    var mockMeals: [Meals] = []
    var mockMealDetails: [MealsDetail] = []
    
    func fetchMeals() async throws -> [Meals] {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockMeals
    }
    
    func fetchMealDetails(id: String) async throws -> [MealsDetail] {
        if shouldReturnError {
            throw NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
        return mockMealDetails
    }
}
