//
//  CocktailDetailView.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import SwiftUI

struct CocktailDetailView: View {
    let cocktail: Cocktail
    @ObservedObject private var viewModel = CocktailDetailViewModel()
    @State private var imageData: Data?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Imagen
                URLImage(url: URL(string: cocktail.strDrinkThumb))
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(10)
                
                // Título
                Text(viewModel.cocktailDetail?.strDrink ?? "")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Categoría, Alcohólico, Vidrio
                Text("Category: \(viewModel.cocktailDetail?.strCategory ?? "")")
                Text("Alcoholic: \(viewModel.cocktailDetail?.strAlcoholic ?? "")")
                Text("Glass: \(viewModel.cocktailDetail?.strGlass ?? "")")
                
        
                // Ingredientes
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.headline)
                    Text(viewModel.cocktailDetail?.strIngredient1 ?? "")
                    Text(viewModel.cocktailDetail?.strIngredient2 ?? "")
                    Text(viewModel.cocktailDetail?.strIngredient3 ?? "")
                    // Agregar más ingredientes si es necesario
                }
            }
            .padding()
        }
        .navigationBarTitle(Text(cocktail.strDrink), displayMode: .inline)
        .onAppear {
            self.viewModel.fetchCocktailDetail(byID: self.cocktail.idDrink)
        }
    }
    
}
