import XCTest

import webscrapeTests

var tests = [XCTestCaseEntry]()
tests += webscrapeTests.allTests()
XCTMain(tests)
