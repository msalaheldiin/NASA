//
//  PODDetailsContracts.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

// MARK: - View
protocol PODDetailsViewProtocol: AnyObject {
    var presenter: PODDetailsPresenterProtocol {get set}
    func setupUI(item:PODCellViewModel)
}

// MARK: - Presenter
protocol PODDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor
protocol PODDetailsInteractorProtocol: AnyObject {
    var presenter: PODDetailsInteractorOutputProtocol? {get set}
}

// MARK: - Interactor Output
protocol PODDetailsInteractorOutputProtocol: AnyObject {

}

// MARK: - Router
protocol PODDetailsCoordinatorProtocol {
}

