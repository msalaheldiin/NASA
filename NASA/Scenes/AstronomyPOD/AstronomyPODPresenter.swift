//
//  AstronomyPODPresenter.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

class AstronomyPODPresenter  {
    
    // MARK: - Variables
    weak var view: AstronomyPODViewProtocol?
    private let interactor: AstronomyPODInteractorProtocol
    let wirframe: AstronomyPODCoordinatorProtocol
    private var astronomyPODItems = [PODCellViewModel]()
    private var startDaysValue: Int
    private var endDaysValue: Int
    
    private var startDate: Date {
        return Date.changeDaysBy(days: startDaysValue)
    }
    private var endDate: Date {
        return Date.changeDaysBy(days: endDaysValue)
    }
    
    // MARK: - Init
    init(interactor: AstronomyPODInteractorProtocol,
         wirframe: AstronomyPODCoordinatorProtocol,
         startDaysValue: Int,
         endDaysValue: Int) {
        self.interactor = interactor
        self.wirframe = wirframe
        self.startDaysValue = startDaysValue
        self.endDaysValue = endDaysValue
    }
}

// MARK: - AstronomyPODPresenterProtocol

extension AstronomyPODPresenter: AstronomyPODPresenterProtocol {
    var numberOfItems: Int {
        return astronomyPODItems.count
    }
    
    func viewDidLoad() {
        fetchNewPhotos()
    }
    
    func fetchNewPhotos() {
        print(startDaysValue,endDaysValue)
        print(startDate.getFormattedDate(),
            endDate.getFormattedDate())
        interactor.getAstronomyPOD(startDate: startDate.getFormattedDate(),
                                   endDate: endDate.getFormattedDate())
    }
    
    func configure(reviewOrderCell cell: PODCellViewProtocol, forIndex indexPath: IndexPath) {
        let model = astronomyPODItems[indexPath.row]
        cell.setItem(model)
    }
    
    func didSelectRowAt(forIndex indexPath: IndexPath) {
        wirframe.navigateToPODDetails(item: astronomyPODItems[indexPath.row])
    }
}

// MARK: - AstronomyPODInteractorOutputProtocol

extension AstronomyPODPresenter : AstronomyPODInteractorOutputProtocol {
    func astronomyPODLoadedSuccessfully(response: [PODResponse]) {
        
        astronomyPODItems.append(contentsOf: response.reversed().map({PODCellViewModel(item: $0)}))
        startDaysValue -= 10
        endDaysValue -= 10
        view?.reloadData()
    }
    
    func astronomyPODLoadeFailed(error: AppError) {
        view?.errorInloadingData(errorMessage: error.localizedDescription)
      }
}

