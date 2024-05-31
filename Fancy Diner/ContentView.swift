//
//  ContentView.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    let menuSections = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationStack {
            List {
                ForEach(menuSections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            ItemRow(menuItem: item)
                        }
                    }
                    //.headerProminence(.increased)
                }
            }
            .navigationTitle("Menu")
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ContentView()
}
