//
//  ContentView.swift
//  Concurrency
//
//  Created by Ilona Sellenberkova on 29/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HandlerImageView()
                .tabItem {
                    Label("Old", systemImage: "tray.and.arrow.down.fill")
                }
            AsyncImageView()
                .tabItem {
                    Label("New", systemImage: "tray.and.arrow.up.fill")
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
