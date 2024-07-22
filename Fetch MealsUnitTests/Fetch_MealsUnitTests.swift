//
//  Fetch_MealsUnitTests.swift
//  Fetch MealsUnitTests
//
//  Created by Ben Do on 7/22/24.
//

import XCTest
@testable import Fetch_Meals

final class Fetch_MealsUnitTests: XCTestCase {
    
    var dataService: DataService!
    
    override func setUp() {
        dataService = DataService()
    }

    override func tearDown() {
        dataService = nil
    }

    func testMakeInstructions() {
        // Given - Arrange
        var expected: String = ""
        
        // When - Act
        
        // Then - Assert
    }

}
