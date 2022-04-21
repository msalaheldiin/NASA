//
//  AstronomyPODViewController.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 12/04/2022.
//

import UIKit

class AstronomyPODViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Variables
    var presenter: AstronomyPODPresenterProtocol
    var isLoadingStarted = true
    
    // MARK: - Init
    init(presenter: AstronomyPODPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName:"\(AstronomyPODViewController.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        presenter.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        tableView.delegate = self
    }
    
    // MARK: - Paging
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if presenter.numberOfItems < 50 && isLoadingStarted {
            isLoadingStarted = false
            presenter.fetchNewPhotos()
        }
    }
}
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isLoadingStarted = true
    }
}

// MARK: - AstronomyPODViewProtocol
extension AstronomyPODViewController : AstronomyPODViewProtocol {
 
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
             }
    }
    
    func errorInloadingData(errorMessage: String) {
        alert(title: "Error", message: errorMessage)
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true

    }    
}

// MARK: - Setup UI
extension AstronomyPODViewController {
    
    private func setupNavigationBar() {
        title = "NASA Astronomy Photos"
    }
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: PODTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PODTableViewCell.identifier)
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension AstronomyPODViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getAstronomyPODCell(indexPath: indexPath)
    }
    
    private func getAstronomyPODCell(indexPath: IndexPath) -> PODTableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: PODTableViewCell.identifier, for: indexPath) as? PODTableViewCell else {
            fatalError("PODTableViewCell Cell Not Registered")
        }
        presenter.configure(reviewOrderCell: cell, forIndex: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AstronomyPODViewController: UITableViewDelegate {
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     presenter.didSelectRowAt(forIndex : indexPath)
 }
}
