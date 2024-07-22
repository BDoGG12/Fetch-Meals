//
//  MealsDetailViewModelTests.swift
//  Fetch MealsTests
//
//  Created by Ben Do on 7/22/24.
//

import XCTest
@testable import Fetch_Meals

class MealsDetailViewModelTests: XCTestCase {

    var viewModel: MealsDetailViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = MealsDetailViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testLoadMealDetailSuccess() async {
        // Given
        let expectedDetails = [
            MealsDetail(
                idMeal: "52768",
                meal: "Apple Frangipan Tart",
                category: "Dessert",
                instructions: """
                Preheat the oven to 200C/180C Fan/Gas 6.
                Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.
                Cream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.
                Peel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.
                Bake for 20-25 minutes until golden-brown and set.
                Remove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.
                Transfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.
                """,
                mealThumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
                ingredient1: "digestive biscuits",
                ingredient2: "butter",
                ingredient3: "Bramley apples",
                ingredient4: "butter, softened",
                ingredient5: "caster sugar",
                ingredient6: "free-range eggs, beaten",
                ingredient7: "ground almonds",
                ingredient8: "almond extract",
                ingredient9: "flaked almonds",
                ingredient10: "",
                ingredient11: "",
                ingredient12: "",
                ingredient13: "",
                ingredient14: "",
                ingredient15: "",
                ingredient16: "",
                ingredient17: "",
                ingredient18: "",
                ingredient19: "",
                ingredient20: "",
                measure1: "175g/6oz",
                measure2: "75g/3oz",
                measure3: "200g/7oz",
                measure4: "75g/3oz",
                measure5: "75g/3oz",
                measure6: "2",
                measure7: "75g/3oz",
                measure8: "1 tsp",
                measure9: "50g/1¾oz",
                measure10: "",
                measure11: "",
                measure12: "",
                measure13: "",
                measure14: "",
                measure15: "",
                measure16: "",
                measure17: "",
                measure18: "",
                measure19: "",
                measure20: ""
            )
        ]
        mockNetworkManager.mockMealDetails = expectedDetails
        
        // When
        await viewModel.loadMealDetail(id: "52768")
        
        // Then
        XCTAssertEqual(viewModel.details, expectedDetails)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testLoadMealDetailFailure() async {
        // Given
        mockNetworkManager.shouldReturnError = true
        
        // When
        await viewModel.loadMealDetail(id: "52768")
        
        // Then
        XCTAssertTrue(viewModel.details.isEmpty)
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Mock error")
    }
}
