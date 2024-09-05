//
//  Cocktail.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//


import Foundation

struct Cocktail: Codable, Identifiable {
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
    
    var id: String { idDrink }
}

struct CocktailResponse: Codable {
    let drinks: [Cocktail]
}

