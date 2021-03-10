//
//  GymScorUITests.swift
//  GymScorUITests
//
//  Created by Sofi on 10.03.2021.
//

import XCTest

class GymScorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccess() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
        
        let app = XCUIApplication()
        app.launch()
        let signUpButton = app.buttons["Sign Up"]
        signUpButton.tap()
         let name =  app.otherElements.containing(.textField, identifier: "name1")
        app.staticTexts["Invanov"].tap()
        name.firstMatch.tap()
        name.firstMatch.typeText("23")
let email = app.otherElements.containing(.textField, identifier: "email")
        app.staticTexts["Ivanov@mail.com"].tap()
        email.firstMatch.typeText("23@")
        let pass = app.otherElements.containing(.textField, identifier: "pass1")
        
//
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element(boundBy: 2)
        textField.tap()
        pass.firstMatch.typeText("23")
        let textField1 = element.children(matching: .textField).element(boundBy: 3)
        textField1.tap()
        let repass = app.otherElements.containing(.textField, identifier: "repass")
        repass.firstMatch.typeText("23")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//

        signUpButton.tap()
        app.staticTexts["Ivanov"].tap()
        let name1 = app.otherElements.containing(.textField, identifier: "name")
        name1.firstMatch.typeText("23")
     
        let element1 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField2 = element1.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        let pass1 = app.otherElements.containing(.textField, identifier: "pass")
        pass1.firstMatch.typeText("23")

        let signInButton = app.buttons["Sign In"]
        signInButton.tap()
       
        
        
        
        
     
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFailor() throws {
        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
        
        let app = XCUIApplication()
        app.launch()
        let signUpButton = app.buttons["Sign Up"]
        signUpButton.tap()
         let name =  app.otherElements.containing(.textField, identifier: "name1")
        app.staticTexts["Invanov"].tap()
        name.firstMatch.tap()
        name.firstMatch.typeText("23")
let email = app.otherElements.containing(.textField, identifier: "email")
        app.staticTexts["Ivanov@mail.com"].tap()
        email.firstMatch.typeText("23@")
        let pass = app.otherElements.containing(.textField, identifier: "pass1")
        
//
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element(boundBy: 2)
        textField.tap()
        pass.firstMatch.typeText("23")
        let textField1 = element.children(matching: .textField).element(boundBy: 3)
        textField1.tap()
        let repass = app.otherElements.containing(.textField, identifier: "repass")
        repass.firstMatch.typeText("23")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//

        signUpButton.tap()
        app.staticTexts["Ivanov"].tap()
        let name1 = app.otherElements.containing(.textField, identifier: "name")
        name1.firstMatch.typeText("2sdfg3")
     
        let element1 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField2 = element1.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        let pass1 = app.otherElements.containing(.textField, identifier: "pass")
        pass1.firstMatch.typeText("2sdfghj3")

        let signInButton = app.buttons["Sign In"]
        signInButton.tap()
        
        
        
        
        
     
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
