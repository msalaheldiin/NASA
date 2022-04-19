//
//  PODModel.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 13/04/2022.
//

import Foundation

//MARK: - AstronomyPOD
struct PODResponse: Codable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?
}
