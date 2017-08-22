//
//  SO45820305Tests.swift
//  SO45820305Tests
//
//  Created by Jakub Mazur on 22/08/2017.
//  Copyright © 2017 Jakub Mazur. All rights reserved.
//

import XCTest
@testable import SO45820305Testing

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: ViewController = (storyboard.instantiateInitialViewController() as? ViewController)!
        return viewController
    }()
    
    override func setUp() {
        super.setUp()
        _ = viewController.view
    }
    
    func testAppendNewData() {
        viewController.appendNewData(["a","b","c","d"])
    }
    
}
