//
//  UIViewController+Extension.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 20/04/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let actionSheetController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
}
