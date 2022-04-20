//
//  PODDetailsRouter.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation


import UIKit


class PODDetailsCoordinator: PODDetailsCoordinatorProtocol {
    
    // MARK: - Variables
    let navigationController: UINavigationController
    
    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(item: PODCellViewModel) {
        let interactor = PODDetailsInteractor()
        let presenter = PODDetailsPresnter.init(interactor: interactor, wirframe: self, item: item)
        interactor.presenter = presenter
        let vc = PODDetailsViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
}
