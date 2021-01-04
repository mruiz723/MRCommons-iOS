//
//  BindableTests.swift
//  MRCommonsTests
//
//  Created by Marlon David Ruiz Arroyave on 2/01/21.
//

import XCTest
@testable import MRCommons

class BindableTests: XCTestCase {
    
    var bindableInt: Bindable<Int>?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bindableInt = Bindable(0)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        bindableInt = nil
    }

    func testInitWithIntValue() {
        let expectedIntValue: Int = 0
        XCTAssertEqual(bindableInt?.value, expectedIntValue, "Bindable value does not match expected initial value")
    }
    
    func testBindListenerCallWhenValueChanges() {
        // Given
        var counter: Int = 0
        var value: Int = 1
        
        // When
        bindableInt?.value = value
        
        // Then
        bindableInt?.bind { newValue in
            counter += 1
            XCTAssertEqual(newValue, value)
        }
        
        XCTAssertEqual(counter, 0, "Closure should not be called")
        
        value = 7
        bindableInt?.value = 7
        
        XCTAssertEqual(counter, 1, "Closure should be called")
    }
    
    func testBindAndFireListenerMethodWhenValueChanges() {
        // Given
        var counter: Int = 0
        var value: Int = 1
        
        // When
        bindableInt?.value = value
        
        // Then
        bindableInt?.bindAndFire { newValue in
            counter += 1
            XCTAssertEqual(newValue, value)
        }
        
        XCTAssertEqual(counter, 1, "Closure should be called first time")
        
        value = 7
        bindableInt?.value = 7
        
        XCTAssertEqual(counter, 2, "Closure should be called second time")
    }

}
