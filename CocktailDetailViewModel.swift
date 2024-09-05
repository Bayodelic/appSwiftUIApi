//
//  CocktailDetailViewModel.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import Foundation
import Combine

class CocktailDetailViewModel: ObservableObject {
    @Published var cocktailDetail: CocktailDetail?
    var cancellable: AnyCancellable?
    
    func fetchCocktailDetail(byID id: String) {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)"
        if let url = URL(string: urlString) {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: CocktailDetailResponse.self, decoder: JSONDecoder())
                .map { $0.drinks.first }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [weak self] in
                    self?.cocktailDetail = $0
                })
        }
    }
}
