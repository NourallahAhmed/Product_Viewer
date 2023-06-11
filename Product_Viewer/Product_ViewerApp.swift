//
//  Product_ViewerApp.swift
//  Product_Viewer
//
//  Created by NourAllah on 08/06/2023.
//

import SwiftUI

@main
struct Product_ViewerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
