//
//  AsyncImage.swift
//  appSwiftUIApi
//
//  Created by braulio on 10/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    private let placeholder: Image

    init(url: URL?, placeholder: Image = Image(systemName: "photo")) {
        imageLoader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: imageLoader.load)
    }

    private var image: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
            } else {
                placeholder
                    .resizable()
            }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL?

    init(url: URL?) {
        self.url = url
    }

    func load() {
        guard let url = url, image == nil else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self.image = uiImage
            }
        }
        task.resume()
    }
}
