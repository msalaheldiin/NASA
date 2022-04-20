//
//  AstronomyPODContracts.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

// MARK: - View
protocol AstronomyPODViewProtocol: AnyObject {
    var presenter: AstronomyPODPresenterProtocol {get set}
    func reloadData()
    func showAPIError(errorMessage: String)
}

// MARK: - Presenter
protocol AstronomyPODPresenterProtocol: AnyObject {
    var numberOfItems: Int { get }
    func viewDidLoad()
     func configure(reviewOrderCell cell: PODCellViewProtocol, forIndex indexPath: IndexPath)
    func didSelectRowAt(forIndex indexPath: IndexPath)
    func fetchNewPhotos()
}

// MARK: - Interactor
protocol AstronomyPODInteractorProtocol: AnyObject {
    var presenter: AstronomyPODInteractorOutputProtocol? {get set}
    func getAstronomyPOD(startDate: String , endDate: String)
}

// MARK: - Interactor Output
protocol AstronomyPODInteractorOutputProtocol: AnyObject {
    func astronomyPODLoadedSuccessfully(response: [PODResponse])
    func astronomyPODLoadeFailed(error: AppError)
}

// MARK: - Router
protocol AstronomyPODCoordinatorProtocol {
    func navigateToPODDetails(item: PODCellViewModel)
}

// MARK: - PODCellViewProtocol
protocol PODCellViewProtocol: AnyObject {
    func setItem(_ model: PODCellViewModel)
 }
