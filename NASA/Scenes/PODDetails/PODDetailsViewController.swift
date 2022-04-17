//
//  PODDetailsViewController.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import UIKit

class PODDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var detailsValueTextView: UITextView!
    @IBOutlet weak var astronomyIV: UIImageView!
    @IBOutlet weak var titleValueLabel: UILabel!
 
    
    // MARK: - Variables
    var presenter: PODDetailsPresenterProtocol
    
    // MARK: - Init

    init(presenter: PODDetailsPresenterProtocol) {
    self.presenter = presenter
        super.init(nibName:"\(PODDetailsViewController.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Lify Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: - Setup UI
extension PODDetailsViewController {
    
    private func setupNavigationBar() {
        title = "Photo Details"
    }
}

// MARK: -  Extensions
extension PODDetailsViewController : PODDetailsViewProtocol {
    func setupUI(item: PODCellViewModel) {
        titleValueLabel.text = item.title
        astronomyIV.downloaded(from: item.hdurl)
        detailsValueTextView.text = item.explanation
    }
}
