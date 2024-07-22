//
//  MealsViewModel.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/18/24.
//

import Foundation

class MealsViewModel: ObservableObject {
    
    @Published var meals: [Meals] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    // fetch meals
    func loadMeals() async {
        do {
            let fetchedMeals = try await fetchMealsFromAPI()
            DispatchQueue.main.async {
                self.meals = fetchedMeals
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func fetchMealsFromAPI() async throws -> [Meals] {
        let fetchedMeals = try await networkManager.fetchMeals()
        return fetchedMeals
    }
}
