//
//  NASATests.swift
//  NASATests
//
//  Created by Mahmoud Salaheldin on 19/04/2022.
//

import XCTest
@testable import NASA


class MockSuccessInteractor: AstronomyPODInteractorProtocol {
    var presenter: AstronomyPODInteractorOutputProtocol?
    func getAstronomyPOD(startDate: String, endDate: String) {
        presenter?.astronomyPODLoadedSuccessfully(response: [PODResponse(copyright: "Wang LetianEyes at Night", date: "2022-04-10", explanation: "Was this image of the Moon's surface", hdurl: "", mediaType: "image", serviceVersion: "v1", title: "Shadows at the Moon's South Pole", url: "https://apod.nasa.gov/apod/image/2204/SouthPoleShadows_LRO_960.jpg")])
    }
}

class MockFailurInteractor: AstronomyPODInteractorProtocol {
    var presenter: AstronomyPODInteractorOutputProtocol?
    
    func getAstronomyPOD(startDate: String, endDate: String) {
        presenter?.astronomyPODLoadeFailed(error: .ConnectionFailures)
    }
}

class AstronomyPODViewMock: AstronomyPODViewProtocol {
    var presenter: AstronomyPODPresenterProtocol
    init(presenter: AstronomyPODPresenterProtocol) {
        self.presenter = presenter
    }
    var dataSuccessed = false
    var errorHappended = false
    func reloadData() {
        dataSuccessed = true
    }
    
    func errorInloadingMethods(errorMessage: String) {
        errorHappended = true
    }
}

class NASATests: XCTestCase {
    let promise = XCTestExpectation(description: "Fetch Completed")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPISuccess(){
        let interactor = MockSuccessInteractor()
        let navigationController = UINavigationController()
        let wireFrame = AstronomyPODRouteCoordinator(navigationController: navigationController)
        let presenter = AstronomyPODPresenter(interactor: interactor, wirframe: wireFrame, startDaysValue: -10, endDaysValue: -1)
        interactor.presenter = presenter
        presenter.fetchNewPhotos()
        promise.fulfill()
        wait(for: [promise], timeout: 1)
        assert(presenter.numberOfItems > 0)
        
    }
    
    func testAPIFail(){

        let interactor = MockFailurInteractor()
        let navigationController = UINavigationController()
        let wireFrame = AstronomyPODRouteCoordinator(navigationController: navigationController)
        let presenter = AstronomyPODPresenter(interactor: interactor, wirframe: wireFrame, startDaysValue: -10, endDaysValue: -1)
        interactor.presenter = presenter
        presenter.fetchNewPhotos()
        sleep(2)
        XCTAssertNotNil(presenter.numberOfItems)
    }
    
    func testGetFormattedDate(){
        let startDate: Date =  Date.changeDaysBy(days: 0)
        let currentDate = Date()
        assert(startDate.getFormattedDate() == currentDate.getFormattedDate())
    }
    
    func testChangeDaysBy(){
        let formatter = DateFormatter()
        let startDate: Date =  Date.changeDaysBy(days: 0)
        let currentDate = Date()
        formatter.dateFormat = "dd"
        assert(formatter.string(from: startDate) == formatter.string(from: currentDate))
    }
}
