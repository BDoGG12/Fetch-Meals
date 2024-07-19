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
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("Hello")
                }
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
