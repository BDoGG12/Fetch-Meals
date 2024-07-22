//
//  MealsDetailViewModel.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/21/24.
//

import Foundation

class MealsDetailViewModel: ObservableObject {
    
    @Published var details: [MealsDetail] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func loadMealDetail(id: String) async {
        
        do {
            let fetchedDetails = try await fetchMealDetailAPI(id: id)
            DispatchQueue.main.async {
                self.details = fetchedDetails
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func fetchMealDetailAPI(id: String) async throws -> [MealsDetail] {
        
        var mealDetail = try await NetworkManager.shared.fetchMealDetails(id: id)
        return mealDetail
    }
    
}