//
//  MealsViewModelTests.swift
//  Fetch MealsTests
//
//  Created by Ben Do on 7/22/24.
//

import XCTest
@testable import Fetch_Meals

class MealsViewModelTests: XCTestCase {

    var viewModel: MealsViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = MealsViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testLoadMealsSuccess() async {
        // Given
        let expectedMeals = [
            Meals(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"),
            Meals(strMeal: "Apple & Blackberry Crumble", strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg", idMeal: "52893"),
            Meals(strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg", idMeal: "52768")
        ]
        mockNetworkManager.mockMeals = expectedMeals
        
        // When
        await viewModel.loadMeals()
        
        // Then
        XCTAssertEqual(viewModel.meals, expectedMeals)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testLoadMealsFailure() async {
        // Given
        mockNetworkManager.shouldReturnError = true
        
        // When
        await viewModel.loadMeals()
        
        // Then
        XCTAssertTrue(viewModel.meals.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Mock error")
    }
}
