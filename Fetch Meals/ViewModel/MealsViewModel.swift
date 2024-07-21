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
    
    // fetch meals
    func loadMeals() async {
        do {
            let fetchedMeals = try await fetchMealsFromAPI()
            DispatchQueue.main.async {
                self.meals = fetchedMeals
                print("Fetched Meals: \(self.meals)")
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func fetchMealsFromAPI() async throws -> [Meals] {
        var fetchedMeals = try await NetworkManager.shared.fetchMeals()
        return fetchedMeals
    }
}
