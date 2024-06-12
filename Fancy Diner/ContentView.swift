//
//  ContentView.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var order: Order
    let menuSections = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationStack {
            List {
                ForEach(menuSections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            /*
                             NOTE:
                             Every time SwiftUI creates a row in our List, it will also create the NavigationLink and ALSO create the ItemDetail for every visible row!

                            NavigationLink {
                                ItemDetail(item: item)
                            }, label: {
                                ItemRow(menuItem: item)
                            }
                             */

                            NavigationLink(value: item) {
                                ItemRow(menuItem: item)
                            }
                        }
                    }
                    //.headerProminence(.increased)
                }
            }
            .navigationTitle("Menu")
            .listStyle(.insetGrouped)

            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
                    .environmentObject(order)
            }

            /*
             The below doesn't seem to work with the EnvironmentObject added to it
             */
            //.navigationDestination(for: MenuItem.self, destination: ItemDetail.init)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Order())
}
