//
//  AstronomyPODInteractor.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

class AstronomyPODInteractor: AstronomyPODInteractorProtocol {
   
    var presenter:AstronomyPODInteractorOutputProtocol?
    func getAstronomyPOD(startDate: String, endDate: String){
        NetworkManager.shared.fetchData(withUrlRequest: URLRequest.init(url: URL.init(string: AppURLS.nasaPhotos)!), andResponceType: [PODResponse].self, andCompletion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.astronomyPODLoadedSuccessfully(response: response)
            case .failure(let error):
                self?.presenter?.astronomyPODLoadeFailed(error: error)
            }
        })
    }
}
