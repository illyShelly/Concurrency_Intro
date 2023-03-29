//
//  ContentView.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 27/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loaderVM = ImageLoadingViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = loaderVM.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .navigationTitle("Random Image")
        }
        .onAppear {
            loaderVM.fetchImage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
