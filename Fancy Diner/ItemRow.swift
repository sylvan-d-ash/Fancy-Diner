//
//  ItemRow.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 30/05/2024.
//

import SwiftUI

struct ItemRow: View {
    let menuItem: MenuItem
    private let colours: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var body: some View {
        HStack {
            Image(menuItem.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))

            VStack(alignment: .leading) {
                Text(menuItem.name)
                    .font(.headline)
                Text("$\(menuItem.price)")
            }

            Spacer()

            ForEach(menuItem.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(colours[restriction, default: .black])
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    ItemRow(menuItem: MenuItem.example)
}
