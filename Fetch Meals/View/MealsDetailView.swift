//
//  MealsDetailView.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/17/24.
//

import SwiftUI

struct MealsDetailView: View {
    @State var id: String
    @StateObject var viewModel = MealsDetailViewModel(networkManager: NetworkManager.shared)
    @State var ingredients = ""
    @State var instructions = ""
    var service = DataService()
    var body: some View {
        VStack {
            if viewModel.details.isEmpty {
                Text("Loading...")
            } else {
                ScrollView {
                    if let imageUrl = URL(string: viewModel.details.first?.mealThumbnail ?? "") {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                    }
                    Text(viewModel.details.first?.meal ?? "")
                        .padding()
                        .font(.title)
                    Text("Instructions")
                        .padding()
                        .font(.title2)
                    Text(instructions)
                        .padding()
                    
                    Spacer()
                    
                    Text("Ingredients")
                        .padding(.bottom)
                        .font(.title2)
                    Text(ingredients)
                        .padding(.bottom)
                }
            }
        }
        .task {
            await viewModel.loadMealDetail(id: id)
            instructions = service.makeInstructions(detailInstructions: viewModel.details.first?.instructions ?? "")
            ingredients = service.makeIngredientsAndMeasurements(detail: viewModel.details.first)
        }
    }
}

#Preview {
    MealsDetailView(id: "")
}
