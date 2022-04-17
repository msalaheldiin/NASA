//
//  SelectOrderCellUIModel.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 13/04/2022.
//

import Foundation

//MARK: - PODCellViewModel
public struct PODCellViewModel{
    private(set) var title: String
    private(set) var hdurl: String
    private(set)var date: String
    private(set)var explanation: String

    init(item: PODResponse) {
        title = item.title ?? ""
        hdurl = item.hdurl ?? ""
        date = item.date ?? ""
        explanation = item.explanation ?? ""
    }
}
