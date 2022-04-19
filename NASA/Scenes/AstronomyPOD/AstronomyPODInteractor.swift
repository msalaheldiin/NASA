//
//  AstronomyPODInteractor.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation



class AstronomyPODInteractor: AstronomyPODInteractorProtocol {
    private var network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    var presenter:AstronomyPODInteractorOutputProtocol?
    
    func getAstronomyPOD(startDate: String, endDate: String){
        network.fetchData(withUrlRequest: APIEndPoint.nasaPhotos(startDate: startDate, endDate: endDate), andResponceType: [PODResponse].self, andCompletion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.astronomyPODLoadedSuccessfully(response: response)
            case .failure(let error):
                self?.presenter?.astronomyPODLoadeFailed(error: error)
            }
        })
    }
}
