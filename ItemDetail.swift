//
//  ItemDetail.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 31/05/2024.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()

                Text("Photo: \(item.photoCredit)")
                    .padding(4) // NOTE: If padding and background are swapped, result is different
                    .font(.caption)
                    .background(.black)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5) // NOTE: any modifiers placed after offset() won’t be affected by the change in position
            }

            Text(item.description)
                .padding()

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
    }
}
