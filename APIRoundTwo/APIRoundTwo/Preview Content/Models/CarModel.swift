//
//  CarModel.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//

import Foundation
struct Car: Codable {

    let carClass: String


    let model: String


    enum CodingKeys: String, CodingKey {
   
        case carClass = "class"
     
        case model
 
    }
}
