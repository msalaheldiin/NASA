//
//  AstronomyPODٍRouter.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation
import UIKit


class AstronomyPODRouteCoordinator: AstronomyPODCoordinatorProtocol {
 
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start(startDaysValue: Int , endDaysValue: Int) {
        let interactor = AstronomyPODInteractor()
        let presenter = AstronomyPODPresenter.init(interactor: interactor, wirframe: self, startDaysValue: startDaysValue, endDaysValue: endDaysValue)
        interactor.presenter = presenter
        let vc = AstronomyPODViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToPODDetails(item: PODCellViewModel) {
        PODDetailsCoordinator.init(navigationController: navigationController).start(item: item)
    }
    
}
