//
//  ContentView.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = CocktailViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Cocktails", text: $searchText, onCommit: {
                    self.viewModel.fetchCocktails(byName: self.searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                List(viewModel.cocktails) { cocktail in
                    NavigationLink(destination: CocktailDetailView(cocktail: cocktail)) {
                        HStack {
                            URLImage(url: URL(string: cocktail.strDrinkThumb))
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(cocktail.strDrink)
                        }
                    }
                }
            }
            .navigationBarTitle("Cocktails")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
