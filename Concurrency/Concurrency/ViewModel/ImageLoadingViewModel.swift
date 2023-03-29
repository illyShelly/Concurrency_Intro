//
//  ImageLoadingViewModel.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 29/03/2023.
//

import Foundation
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    @Published var image: UIImage? = nil

    // URL object to fetch
    let url = URL(string: "https://picsum.photos/1500/2500")!

    
    func handler(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let img = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                print("Wrong server response.")
                return nil // add as optional image
        }
        return img
    }
    
    func fetchImage() {
        // The completion handler takes three parameters: data, response, and error.
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error occured: \(error.localizedDescription)")
                return
            }
            // Return the image
            self.image = self.handler(data: data, response: response)
        }
        .resume()  // request to the server and start waiting for a response.
    }
    
    func fetchWithAsync() async throws -> UIImage? {
        do {
            // handle success
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil) // using try? do not need unwrapped
            let image = handler(data: data, response: response) // calling handler to handle data & response
            return image
        } catch {
            // handle error
            print(error.localizedDescription)
            throw error
        }
    }
}
