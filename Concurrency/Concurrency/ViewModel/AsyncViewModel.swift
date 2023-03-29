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
        if let img = try? await loader.fetchWithAsync()  { // need keyword above to see method
            self.image = img
        }
    }
}
