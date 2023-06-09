//
//  AsyncImageView.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 29/03/2023.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject var asyncVM = AsyncViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let asyncImage = asyncVM.image {
                    Image(uiImage: asyncImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    ProgressView() // meanwhile loading
                }
            }
            .navigationTitle("Async Image")
        }
        .onAppear {
            Task {
                await asyncVM.loadImage()
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
