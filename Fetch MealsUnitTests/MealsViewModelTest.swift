//
//  MealsViewModelTest.swift
//  Fetch Meals
//
//  Created by Ben Do on 7/22/24.
//

import XCTest
@testable import Fetch_Meals

final class MealsViewModelTest: XCTestCase {
    

    func testLoadMealsSuccess() async throws {
        let mockNetworkManager = MockNetworkManager()

        // Arrange
        let expectedMeals = [Meals(strMeal: "Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"), Meals(strMeal: "Honey Yogurt Cheesecake", strMealThumb: "https://www.themealdb.com/images/media/meals/y2irzl1585563479.jpg", idMeal: "53007")]
        mockNetworkManager.fetchMealsResult = .success(expectedMeals)
        
        // Act
        let viewModel = MealsViewModel(networkManager: mockNetworkManager as! NetworkManagerProtocol)
        await viewModel.loadMeals()
        
        // Assert
        XCTAssertEqual(viewModel.meals, expectedMeals)
        XCTAssertNil(viewModel.errorMessage)
    }

}
