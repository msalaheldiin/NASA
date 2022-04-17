//
//  PODCell.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 13/04/2022.
//

import UIKit

class PODTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var astronomyIV: UIImageView!
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var titleValueLabel: UILabel!
    
    // MARK: - Variables

    static let identifier = "\(PODTableViewCell.self)"
    var didTapViewDetials: (()-> Void)?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Extensions

extension PODTableViewCell: PODCellViewProtocol {
    func setItem(_ model: PODCellViewModel) {
        astronomyIV.downloaded(from: model.hdurl)
        dateValueLabel.text = model.date
        titleValueLabel.text = model.title
    }
}


