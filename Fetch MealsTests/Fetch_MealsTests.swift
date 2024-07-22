//
//  Fetch_MealsTests.swift
//  Fetch MealsTests
//
//  Created by Ben Do on 7/22/24.
//

import XCTest
@testable import Fetch_Meals

final class Fetch_MealsTests: XCTestCase {
    
    var dataService: DataService!

    override func setUp() {
        dataService = DataService()
    }
    
    override func tearDown() {
        dataService = nil
    }

    func testMakeInstructions() {
        let instruction = "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning."
        
        // Arrange
        let expected = "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\nFor the filing, spread the base of the flan generously with raspberry jam.\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning."

        // Actual
        let actual = dataService.makeInstructions(detailInstructions: instruction)
        
        // Assert
        
        XCTAssertEqual(actual, expected)

    }


}
