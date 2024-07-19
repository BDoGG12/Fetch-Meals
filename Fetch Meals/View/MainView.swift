//
//  MainView.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/19/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MealsView()
                .tabItem {
                    Label("Meals", systemImage: "fork.knife")
                }
                .preferredColorScheme(.light)
        }
        .preferredColorScheme(.light)
        
    }
}

#Preview {
    MainView()
}
