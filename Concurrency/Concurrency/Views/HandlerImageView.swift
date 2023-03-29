//
//  HandlerImageView.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 27/03/2023.
//

import SwiftUI

struct HandlerImageView: View {
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
            .navigationTitle("Handler Image")
        }.padding(0)
            .ignoresSafeArea(.all)

        .onAppear {
            // using completion handler solutin
            loaderVM.fetchImage()
        }
    }
}

struct HandlerImageView_Previews: PreviewProvider {
    static var previews: some View {
        HandlerImageView()
    }
}
