//
//  ViperList_Entiite.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

struct Viper: Decodable {
    let title: String
    let year: Int
    let creator: [String]
    let rating: String
    let genre: [String]
    let runtime_in_minutes: Int
    let episodes: Int
    let image: String
    let id: Int
}
