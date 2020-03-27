//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Jay Salvador on 26/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import XCTest

class WeatherUITests: XCTestCase {
    
    // MARK: - Attributes
    
    var app: XCUIApplication!

    override func setUp() {
        
        self.app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearch() {
                
        self.app.launch()
        
        self.app.swipeUp()
        self.app.swipeUp()
        
        let button = self.app.buttons.element
        
        button.tap()
        
        let textField = self.app.textFields.element
        
        textField.tap()
        
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["r"].tap()
        app.keys["i"].tap()
        app.keys["s"].tap()
        app.keys["delete"].tap()
        app.keys["delete"].tap()
        app.keys["i"].tap()
        app.keys["s"].tap()
        app.keys["space"].tap()
        app.keys["delete"].tap()
        
        XCTAssertEqual(textField.value as? String, "paris", "Invalid entry (paris)")
        
        let cell = self.app.collectionViews.cells["Paris, FR"]
        
        let expectation = self.expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: cell, handler: nil)
        
        wait(for: [expectation], timeout: 60.0)
        
        cell.tap()
        
        let parisCell = self.app.collectionViews.cells["Paris, FR"]
        
        parisCell.tap()
        
    }
}
