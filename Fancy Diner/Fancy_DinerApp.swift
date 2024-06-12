//
//  Fancy_DinerApp.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 29/05/2024.
//

import SwiftUI

@main
struct Fancy_DinerApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
