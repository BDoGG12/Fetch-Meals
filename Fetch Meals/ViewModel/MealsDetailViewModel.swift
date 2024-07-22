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
    
    var networkManager: NetworkManagerProtocol!
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
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
        
        let mealDetail = try await networkManager.fetchMealDetails(id: id)
        return mealDetail
    }
    
}
