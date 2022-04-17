//
//  AstronomyPODPresenter.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

class AstronomyPODPresenter  {
    
    weak var view: AstronomyPODViewProtocol?
    private let interactor: AstronomyPODInteractorProtocol
    let wirframe: AstronomyPODCoordinatorProtocol
    private var astronomyPODItems = [PODCellViewModel]()
    private var startDaysValue: Int
    private var endDaysValue: Int
    private var startDate = Date()
    private var endDate =  Date()
    
    // MARK: - Init
    init(interactor: AstronomyPODInteractorProtocol,  wirframe: AstronomyPODCoordinatorProtocol, startDaysValue: Int , endDaysValue: Int) {
        self.interactor = interactor
        self.wirframe = wirframe
        self.startDaysValue = startDaysValue
        self.endDaysValue = endDaysValue
    }
}

extension AstronomyPODPresenter: AstronomyPODPresenterProtocol {
    
    var numberOfItems: Int {
        return astronomyPODItems.count
    }
    
    // MARK: - Life Cycle
    func viewDidLoad() {
        startDate = Date.changeDaysBy(days: startDaysValue)
        endDate = Date.changeDaysBy(days: startDaysValue)
        interactor.getAstronomyPOD(startDate: Date.getFormattedDate(date:startDate), endDate: Date.getFormattedDate(date:endDate))
    }
    
    func fetchNewPhotos() {
        
            interactor.getAstronomyPOD(startDate: Date.getFormattedDate(date:startDate), endDate: Date.getFormattedDate(date: endDate))
        
    }
     
    func configure(reviewOrderCell cell: PODCellViewProtocol, forIndex indexPath: IndexPath) {
        let model = astronomyPODItems[indexPath.row]
        cell.setItem(model)
    }
    
    func didSelectRowAt(forIndex indexPath: IndexPath) {
        wirframe.navigateToPODDetails(item: astronomyPODItems[indexPath.row])
    }
    
}

extension AstronomyPODPresenter : AstronomyPODInteractorOutputProtocol {
    func astronomyPODLoadedSuccessfully(response: [PODResponse]) {
        astronomyPODItems.append(contentsOf: response.reversed().map({PODCellViewModel(item: $0)}))
        startDaysValue += 10
        endDaysValue += 10
        view?.reloadData()
        
        print(astronomyPODItems.count,"presenter")
    }
    
    func astronomyPODLoadeFailed(error: AppError) {
        let days = Date.changeDaysBy(days: -7)
        print( Date.getFormattedDate(date: days))
    }
    
}

