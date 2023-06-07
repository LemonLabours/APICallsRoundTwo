//
//  CelebrityModel.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//

import Foundation
struct Celebrity: Codable {
    let name: String

    let gender: String
    let nationality: String
    let occupation: [String]
    let height: Double
    let birthday: String
    let age: Int


    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case nationality
        case occupation
        case height
        case birthday
        case age
        
    }
}


//i have this api :https://api.api-ninjas.com/v1/country?name= Saudi arabia ,
