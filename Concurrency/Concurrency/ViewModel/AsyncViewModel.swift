//
//  AsyncViewModel.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 29/03/2023.
//

import Foundation
import SwiftUI

class AsyncViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    let loader = ImageLoadingViewModel()
    
    func loadImage() async {
        let img = try? await loader.fetchWithAsync()  // need keyword above to see method
        await MainActor.run {
            self.image = img
        }
    }
}

// error -> needs jump to main thread - similar Main Actor - again to 'await'
