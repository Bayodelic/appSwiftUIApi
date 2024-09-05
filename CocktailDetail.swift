//
//  CocktailDetail.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import Foundation

struct CocktailDetail: Codable {
    let idDrink: String
    let strDrink: String
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    var strInstructions: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    // Add more ingredients as needed
}

struct CocktailDetailResponse: Codable {
    let drinks: [CocktailDetail]
}
