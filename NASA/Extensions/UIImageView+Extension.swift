//
//  UIImageView+Extension.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 13/04/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        let activityIndicator = UIActivityIndicatorView(style: .medium)
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0.0),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0)
        ])
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        activityIndicator.startAnimating()

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                }
                return
            }
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}
