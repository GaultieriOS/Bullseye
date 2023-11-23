//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Gaultier on 22/11/2023.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
    var game: Game!
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() throws {
        var guess = game.target + 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws {
        var guess = game.target - 5
        var score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
