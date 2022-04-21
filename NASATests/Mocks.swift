//
//  Mocks.swift
//  NASATests
//
//  Created by Mahmoud Salaheldin on 20/04/2022.
//

import Foundation


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
    
    func errorInloadingData(errorMessage: String) {
        errorHappended = true
    }
    func startAnimating() {
       
   }

   func stopAnimating() {
       
   }
}
