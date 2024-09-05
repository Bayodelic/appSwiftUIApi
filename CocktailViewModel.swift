//
//  CocktailViewModel.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import Foundation
import Combine

class CocktailViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var cocktailDetail: CocktailDetail?

    var cancellable: AnyCancellable?
    
    func fetchCocktails(byName name: String) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(name)"
        if let url = URL(string: urlString) {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: CocktailResponse.self, decoder: JSONDecoder())
                .map { $0.drinks }
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [weak self] in
                    self?.cocktails = $0
                })
        }
    }

}

