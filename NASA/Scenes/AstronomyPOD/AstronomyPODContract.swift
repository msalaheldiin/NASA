//
//  AstronomyPODContracts.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

protocol AstronomyPODViewProtocol: AnyObject {
    var presenter: AstronomyPODPresenterProtocol {get set}
    func reloadData()
    func errorInloadingMethods(errorMessage: String)

}

protocol AstronomyPODPresenterProtocol: AnyObject {
    var numberOfItems: Int { get }
    func viewDidLoad()
     func configure(reviewOrderCell cell: PODCellViewProtocol, forIndex indexPath: IndexPath)
    func didSelectRowAt(forIndex indexPath: IndexPath)
    func fetchNewPhotos()
}

protocol AstronomyPODInteractorProtocol: AnyObject {
    var presenter: AstronomyPODInteractorOutputProtocol? {get set}
    func getAstronomyPOD(startDate: String , endDate: String)
}

protocol AstronomyPODInteractorOutputProtocol: AnyObject {
    func astronomyPODLoadedSuccessfully(response: [PODResponse])
    func astronomyPODLoadeFailed(error: AppError)
}

protocol AstronomyPODCoordinatorProtocol {
    func navigateToPODDetails(item: PODCellViewModel)
}

protocol PODCellViewProtocol: AnyObject {
    func setItem(_ model: PODCellViewModel)
 }
