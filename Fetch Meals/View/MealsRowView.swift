//
//  MealsRowView.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/19/24.
//

import SwiftUI

struct MealsRowView: View {
    
    @State var meal: Meals?
    
    var body: some View {
        HStack {
            if let imageUrl = URL(string: meal?.strMealThumb ?? "") {
                AsyncImage(url: imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipped()
            }
            Text(meal?.strMeal ?? "")
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.black)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    MealsRowView()
}
