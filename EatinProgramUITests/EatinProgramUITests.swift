//
//  EatinProgramUITests.swift
//  EatinProgramUITests
//
//  Created by Amarprakash Mishra on 20/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import XCTest

class EatinProgramUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
//    func testWriteSelectedBurger() {
//        let file = "copy2.png"
//
//        let app = XCUIApplication()
//        app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
//
//        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"burger0").element.waitForExistence(timeout: 2)
//
//
//        let mainScreenScreenshot = XCUIScreen.main.screenshot()
//        let mainScreenScreenshotAttach = XCTAttachment(screenshot: mainScreenScreenshot)
//        self.add(mainScreenScreenshotAttach)
//
//        let data = mainScreenScreenshot.image.pngData()
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let fileURL = dir.appendingPathComponent(file)
//
//            //writing
//            do {
//                try data?.write(to: fileURL)
//            }
//            catch {
//                print("Error: \(error)")
//            }
//        }
//    }
    
    func testReadSelectedBurger() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("copy2.png")
            let fileImage = UIImage(contentsOfFile: fileURL.path)
            
            let app = XCUIApplication()
            app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
            
            app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"burger0").element.waitForExistence(timeout: 2)
            
            let mainScreenScreenshot = XCUIScreen.main.screenshot()
            let currImage = mainScreenScreenshot.image
            
            let fileAttach = XCTAttachment(image: fileImage!)
            self.add(fileAttach)
            let currAttach = XCTAttachment(image: currImage)
            self.add(currAttach)
            
            let data1 = currImage.pngData()
            let data2 = fileImage!.pngData()
            let response = compare(tolerance: 0.1, expected: data1!, observed: data2!)
            print(response)
            XCTAssertTrue(response)
        }
    }
    
    func testWriteSelectedBurgerDetailPage() {
        let file = "copy3.png"
        
        let app = XCUIApplication()
        app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
        
        let cellsQuery = app.collectionViews.cells
        let burger2Element = cellsQuery.otherElements.containing(.image, identifier:"burger2").element
        burger2Element.waitForExistence(timeout: 2)
        burger2Element.tap()
        
        let backButton = app.navigationBars["nav"].buttons["Back"]
        backButton.waitForExistence(timeout: 2)
        
        let mainScreenScreenshot = XCUIScreen.main.screenshot()
        let mainScreenScreenshotAttach = XCTAttachment(screenshot: mainScreenScreenshot)
        self.add(mainScreenScreenshotAttach)
        
        let data = mainScreenScreenshot.image.pngData()
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try data?.write(to: fileURL)
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testReadSelectedBurgerDetailPage() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("copy3.png")
            let fileImage = UIImage(contentsOfFile: fileURL.path)
            XCTContext.runActivity(named: " Go to the current screen ") { activity in
                let app = XCUIApplication()
                app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
                let cellsQuery = app.collectionViews.cells
                let burger2Element = cellsQuery.otherElements.containing(.image, identifier:"burger2").element
                burger2Element.waitForExistence(timeout: 2)
                burger2Element.tap()
                let backButton = app.navigationBars["nav"].buttons["Back"]
                backButton.waitForExistence(timeout: 2)
            }
            
            // SOME OF THE CODES I HAVE PRODUCED AND THEN ADDED MY COMPARE LOGIC
            
            let mainScreenScreenshot = XCUIScreen.main.screenshot()
            let currImage = mainScreenScreenshot.image
            
            XCTContext.runActivity(named: " Adding File Image into report ") { activity in
                let fileAttach = XCTAttachment(image: fileImage!)
                self.add(fileAttach)
            }
            
            XCTContext.runActivity(named: " Adding Current Image into report ") { activity in
                let currAttach = XCTAttachment(image: currImage)
                self.add(currAttach)
            }
            
            XCTContext.runActivity(named: " Compare two images ") { activity in
                let data1 = currImage.pngData()
                let data2 = fileImage!.pngData()
                let response = compare(tolerance: 0.0, expected: data1!, observed: data2!)
                XCTAssertTrue(response)
            }
        }
    }
    
//    func testReadDiffSelectedBurgerDetailPage() {
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let fileURL = dir.appendingPathComponent("copy3.png")
//            let fileImage = UIImage(contentsOfFile: fileURL.path)
//
//            let app = XCUIApplication()
//            app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
//
//            let cellsQuery = app.collectionViews.cells
//            let burger3Element = cellsQuery.otherElements.containing(.image, identifier:"burger3").element
//            burger3Element.waitForExistence(timeout: 2)
//            burger3Element.tap()
//
//            let backButton = app.navigationBars["nav"].buttons["Back"]
//            backButton.waitForExistence(timeout: 2)
//            let mainScreenScreenshot = XCUIScreen.main.screenshot()
//            let currImage = mainScreenScreenshot.image
//
//            let fileAttach = XCTAttachment(image: fileImage!)
//            self.add(fileAttach)
//            let currAttach = XCTAttachment(image: currImage)
//            self.add(currAttach)
//
//            let data1 = currImage.pngData()
//            let data2 = fileImage!.pngData()
//            let response = compare(tolerance: 0.0, expected: data1!, observed: data2!)
//            print(response)
//            XCTAssertFalse(response)
//        }
//    }
    
//    func testWriteSelectedPage() {
//        let file = "copy4.png"
//
//        let app = XCUIApplication()
//        app.tables.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element.tap()
//
//        let cellsQuery = app.collectionViews.cells
//        let burger2Element = cellsQuery.otherElements.containing(.image, identifier:"burger2").element
//        burger2Element.waitForExistence(timeout: 2)
//        burger2Element.tap()
//
//        let backButton = app.navigationBars["nav"].buttons["Back"]
//        backButton.waitForExistence(timeout: 2)
//
////        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 150), false, 0);
////
////        drawViewHierarchyInRect(CGRect(x: 50, y: 50, width: app.frame.size.width, height: app.frame.size.height), afterScreenUpdates: true)
//
//        let mainScreenScreenshot = XCUIScreen.main.screenshot()
////        let mainScreenScreenshotAttach = XCTAttachment(screenshot: mainScreenScreenshot)
////        self.add(mainScreenScreenshotAttach)
////
////        let data = mainScreenScreenshot.image.pngData()
//        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let fileURL = dir.appendingPathComponent(file)
//
//            //writing
//            do {
//                //try data?.write(to: fileURL)
//            }
//            catch {
//                print("Error: \(error)")
//            }
//        }
//    }
//
    private func compare(tolerance: Float, expected: Data, observed: Data) -> Bool {
        guard let expectedUIImage = UIImage(data: expected), let observedUIImage = UIImage(data: observed) else {
            return false
        }
        guard let expectedCGImage = expectedUIImage.cgImage, let observedCGImage = observedUIImage.cgImage else {
            return false
        }
        guard let expectedColorSpace = expectedCGImage.colorSpace, let observedColorSpace = observedCGImage.colorSpace else {
            return false
        }
        if expectedCGImage.width != observedCGImage.width || expectedCGImage.height != observedCGImage.height {
            return false
        }
        let imageSize = CGSize(width: expectedCGImage.width, height: expectedCGImage.height)
        let numberOfPixels = Int(imageSize.width * imageSize.height)
        
        // Checking that our `UInt32` buffer has same number of bytes as image has.
        let bytesPerRow = min(expectedCGImage.bytesPerRow, observedCGImage.bytesPerRow)
        assert(MemoryLayout<UInt32>.stride == bytesPerRow / Int(imageSize.width))
        
        let expectedPixels = UnsafeMutablePointer<UInt32>.allocate(capacity: numberOfPixels)
        let observedPixels = UnsafeMutablePointer<UInt32>.allocate(capacity: numberOfPixels)
        
        let expectedPixelsRaw = UnsafeMutableRawPointer(expectedPixels)
        let observedPixelsRaw = UnsafeMutableRawPointer(observedPixels)
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        guard let expectedContext = CGContext(data: expectedPixelsRaw, width: Int(imageSize.width), height: Int(imageSize.height),
                                              bitsPerComponent: expectedCGImage.bitsPerComponent, bytesPerRow: bytesPerRow,
                                              space: expectedColorSpace, bitmapInfo: bitmapInfo.rawValue) else {
                                                expectedPixels.deallocate()
                                                observedPixels.deallocate()
                                                return false
        }
        guard let observedContext = CGContext(data: observedPixelsRaw, width: Int(imageSize.width), height: Int(imageSize.height),
                                              bitsPerComponent: observedCGImage.bitsPerComponent, bytesPerRow: bytesPerRow,
                                              space: observedColorSpace, bitmapInfo: bitmapInfo.rawValue) else {
                                                expectedPixels.deallocate()
                                                observedPixels.deallocate()
                                                return false
        }

        expectedContext.draw(expectedCGImage, in: CGRect(origin: .zero, size: imageSize))
        observedContext.draw(observedCGImage, in: CGRect(origin: .zero, size: imageSize))
        
        let expectedBuffer = UnsafeBufferPointer(start: expectedPixels, count: numberOfPixels)
        let observedBuffer = UnsafeBufferPointer(start: observedPixels, count: numberOfPixels)
        
        var isEqual = true
        if tolerance == 0 {
            isEqual = expectedBuffer.elementsEqual(observedBuffer)
        } else {
            // Go through each pixel in turn and see if it is different
            var numDiffPixels = 0
            for pixel in 0 ..< numberOfPixels where expectedBuffer[pixel] != observedBuffer[pixel] {
                // If this pixel is different, increment the pixel diff count and see if we have hit our limit.
                numDiffPixels += 1
                let percentage = 100 * Float(numDiffPixels) / Float(numberOfPixels)
                if percentage > tolerance {
                    isEqual = false
                    break
                }
            }
        }
        
        expectedPixels.deallocate()
        observedPixels.deallocate()
        
        return isEqual
    }
}
