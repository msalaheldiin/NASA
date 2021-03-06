//
//  PODDetailsPresnter.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import Foundation


class PODDetailsPresnter  {
    
    // MARK: - Variables
    weak var view: PODDetailsViewProtocol?
    private let interactor: PODDetailsInteractorProtocol
    let wirframe: PODDetailsCoordinatorProtocol
    private var item: PODCellViewModel
    
    // MARK: - Init
    init(interactor: PODDetailsInteractorProtocol,  wirframe: PODDetailsCoordinatorProtocol, item: PODCellViewModel) {
        self.interactor = interactor
        self.wirframe = wirframe
        self.item = item
    }
}

// MARK: - PODDetailsPresenterProtocol
extension PODDetailsPresnter: PODDetailsPresenterProtocol {
    func viewDidLoad() {
        view?.setupUI(item: item)
    }
}

// MARK: - PODDetailsInteractorOutputProtocol
extension PODDetailsPresnter : PODDetailsInteractorOutputProtocol {
    
}
