//
//  DessertView.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/17/24.
//

import SwiftUI

struct MealsView: View {
    @StateObject var viewModel = MealsViewModel()
    @State var meals: [Meals] = []
    @State var error: Error?
    
    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                } else {
                    ScrollView {
                        ForEach (viewModel.meals) { meal in
                            MealsRowView(meal: meal)
                        }
                    }
                }
            }
            .task {
                await viewModel.loadMeals()
            }
        }
        .navigationTitle("Meals")
    }
    
    func getMeals() {
        
    }
}

#Preview {
    MealsView()
}
