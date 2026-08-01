//
//  CrypticApp.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

@main
struct CrypticApp: App {
    
    /*
     Instantiate a dependency container to be
     passed down the view hierarchy and be
     used to inject dependencies required
     by view models
    */
    let dependencyContainer = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(container: dependencyContainer)
                    .toolbar(.hidden)
            }
            .onAppear {
                dependencyContainer.add(CoinManager(networkService: nil))
            }
        }
    }
}
