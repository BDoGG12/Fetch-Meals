//
//  NetworkManagerProtocol.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/22/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchMeals() async throws -> [Meals]
    func fetchMealDetails(id: String) async throws -> [MealsDetail]
}
