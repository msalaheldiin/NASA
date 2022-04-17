//
//  AstronomyPODInteractor.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

protocol URLBuilder {
    var urlRequest: URLRequest{get}
}

enum APIEndPoint: URLBuilder {
    case nasaPhotos(startDate: String , endDate:String)
    
    var urlRequest: URLRequest {
        switch self {
        case .nasaPhotos(let startDate, let endDate):
            var urlComponent = URLComponents(string: AppURLS.nasaPhotos)!
            urlComponent.queryItems = [
                URLQueryItem(name: "api_key", value: "M1pAtOrGfAExrhVpQ1RHwTJO7JKr9r7kEDSKb0NS"),
                URLQueryItem(name: "start_date", value: startDate),
                URLQueryItem(name: "end_date", value: endDate)
            ]
            let request = URLRequest.init(url:urlComponent.url!)

            return request
        }
    }
}

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
