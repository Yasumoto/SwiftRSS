//
//  NSDateExtension_Tests.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 01/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftRSS

class NSDateExtension_Tests: XCTestCase {
    
    let GMT_timeZone = TimeZone(secondsFromGMT: 0)!
    var calendar = Calendar(identifier: .gregorian)
    let calendarComponents = Set<Calendar.Component>([.timeZone, .weekday, .day, .month, .year, .hour, .minute, .second])

    override func setUp() {
        super.setUp()
        calendar.timeZone = GMT_timeZone
    }
    
    override func tearDown() {
        super.tearDown()
    }

// MARK: RFC822
    
    func test_dateFormatter_withDateStringRFC822Format1_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21:36 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.weekday == 1)
            XCTAssert(dateComponent.day == 19)
            XCTAssert(dateComponent.month == 5)
            XCTAssert(dateComponent.year == 2002)
            XCTAssert(dateComponent.hour == 15)
            XCTAssert(dateComponent.minute == 21)
            XCTAssert(dateComponent.second == 36)
            if let timeZone = dateComponent.timeZone {
                XCTAssert(timeZone == GMT_timeZone)
            } else {
                XCTAssert(false, "Timezone was nil: \(dateComponent)")
            }
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format2_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.weekday == 1, "")
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 0, "")
            XCTAssert(dateComponent.timeZone! == GMT_timeZone, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format3_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21:36"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.weekday == 1, "")
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 36, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format4_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.weekday == 1, "")
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 0, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format5_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21:36 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 36, "")
            XCTAssert(dateComponent.timeZone! == GMT_timeZone, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format6_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 0, "")
            XCTAssert(dateComponent.timeZone! == GMT_timeZone, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format7_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21:36"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 36, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format8_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 19, "")
            XCTAssert(dateComponent.month == 5, "")
            XCTAssert(dateComponent.year == 2002, "")
            XCTAssert(dateComponent.hour == 15, "")
            XCTAssert(dateComponent.minute == 21, "")
            XCTAssert(dateComponent.second == 0, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
// MARK: RFC3339
    
    func test_dateFormatter_withDateStringRFC3339Format1_shouldReturnValidDate() {
        
        let dateString = "1996-12-19T16:39:57-0800"
        let timeZone = TimeZone(abbreviation: "PST")
        calendar.timeZone = timeZone!
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 19)
            XCTAssert(dateComponent.month == 12)
            XCTAssert(dateComponent.year == 1996)
            XCTAssert(dateComponent.hour == 16)
            XCTAssert(dateComponent.minute == 39)
            XCTAssert(dateComponent.second == 57)
            if let timeZone = dateComponent.timeZone {
                XCTAssertEqual(timeZone, TimeZone(abbreviation: "PST")!)
            } else {
                XCTFail("timeZone was nil")
            }
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC3339Format2_shouldReturnValidDate() {
        
        let dateString = "1937-01-01T12:00:27.87+0200"
        let timeZone = TimeZone(secondsFromGMT: 60*60*2)
        calendar.timeZone = timeZone!
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssertEqual(dateComponent.day, 1)
            XCTAssertEqual(dateComponent.month, 1)
            XCTAssertEqual(dateComponent.year, 1937)
            XCTAssertEqual(dateComponent.hour, 12)
            XCTAssertEqual(dateComponent.minute, 0)
            XCTAssertEqual(dateComponent.second, 27)
            XCTAssertEqual(dateComponent.timeZone, TimeZone(secondsFromGMT: 60*60*2))
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC3339Format3_shouldReturnValidDate() {
        
        let dateString = "1937-01-01T12:00:27"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendarComponents, from: date)
            
            XCTAssert(dateComponent.day == 1, "")
            XCTAssert(dateComponent.month == 1, "")
            XCTAssert(dateComponent.year == 1937, "")
            XCTAssert(dateComponent.hour == 12, "")
            XCTAssert(dateComponent.minute == 0, "")
            XCTAssert(dateComponent.second == 27, "")
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    


}
