//
//  PODDetailsContracts.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation

protocol PODDetailsViewProtocol: AnyObject {
    var presenter: PODDetailsPresenterProtocol {get set}
    func setupUI(item:PODCellViewModel)
}

protocol PODDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol PODDetailsInteractorProtocol: AnyObject {
    var presenter: PODDetailsInteractorOutputProtocol? {get set}
    func loadPaymentMethds()
}

protocol PODDetailsInteractorOutputProtocol: AnyObject {

}

protocol PODDetailsCoordinatorProtocol {
}

