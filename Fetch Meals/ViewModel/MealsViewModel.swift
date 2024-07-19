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
    func fetchMeals() {
        isLoading = true
        errorMessage = ""
        
        Task {
            do {
                let fetchedMeals = try await NetworkManager.shared.fetchMeals()
                DispatchQueue.main.async { [self] in
                    meals = fetchedMeals
                    isLoading = false
                }
            } catch {
                isLoading = true
                errorMessage = error.localizedDescription
            }
        }
    }
}
