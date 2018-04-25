//
//  RestrictionsTest.swift
//  PicoPlacaSwiftTests
//
//  Created by Andres Efrain Chango Macas on 4/23/18.
//  Copyright © 2018 Andres Efrain Chango Macas. All rights reserved.
//

import XCTest
@testable import PicoPlacaSwift

class RestrictionsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_PlateNumberValidator_WhenPlateisABC1234_ReturnsTrue(){
        let plateValidator = UtilitiesPlateManager ();
        let plateNumber = "ABC1234"
        let response = plateValidator.plateValidator(plate: plateNumber)
        XCTAssertEqual(response, true)
   
    }
    
    func test_GetLastNumberOfPlate_WhenPlateisABC1234_Return4(){
        let plateValidator = UtilitiesPlateManager ();
        let plateNumber = "ABC1234"
        let response = plateValidator.getLastNumberofPlate(plate:plateNumber)
        XCTAssertEqual(response, 4)
        
    }
    
    func test_getDayusingDate_WhenDateis25042018_ReturnWednesday(){
        
        let date = "25042018"
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.getDayusingDate(date: date)
        XCTAssertEqual(response, 4)
        
        
    }
    
    func test_isValidDateFormater_WhenDateis25042018_ReturnTrue(){
        let date = "25042018"
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.isValidDate(date: date)
        XCTAssertEqual(response, true)
        
        
        
    }
    
    func test_isValidTimeFormater_WhenTimeis1430_ReturnTrue(){
        let time = "06:30"
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.isValidTime(time: time)
        XCTAssertEqual(response, true)
        
        
    }
    func test_validatePicoPlacaHour_WhenTimeis0830_ReturnTrue(){
        let time = "19:30"
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.validatePicoPlacaHour(time: time)
        XCTAssertEqual(response, true)
    }
    
    func test_getDayForPicoPlaca_Whenlastnumberis4_returntrue(){
        let lastNumber = 4
         let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.getDayForPicoPlaca(lastNumber: lastNumber)
        
        XCTAssertEqual(response, 3)
 
    }
   
    
    func test_validatePicoPlacaDay_WhenDateis04052018_ReturnTrue(){
        let date = "04052018"
        let plate = "PDA6799"
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.validatePicoPlacaDay(date: date , plate:plate)
        XCTAssertEqual(response, true)
    }
    func test_validateHours(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeConverter = dateFormatter.date(from: "16:00")
        let startTime = dateFormatter.date(from: "16:00")
        let endTime = dateFormatter.date(from: "19:30")
        let plateValidator = UtilitiesPlateManager ();
        let response = plateValidator.validateHour(start: startTime!, end: endTime!, date: timeConverter!)
        
        XCTAssertEqual(response, true)
        
    }
    
    func test_validatePicoYPlaca(){
        let date = "26042018"
        let time = "18:30"
        let plate = "PDB8767"
        let plateValidator = UtilitiesPlateManager()
        let response = plateValidator.validatePicoPlacaAllow(plate: plate, date: date, time: time)
        XCTAssertEqual(response, true)
        
        
        
    }
    
    
}
