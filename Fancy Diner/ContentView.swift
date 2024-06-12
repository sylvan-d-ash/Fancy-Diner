//
//  ContentView.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
}
