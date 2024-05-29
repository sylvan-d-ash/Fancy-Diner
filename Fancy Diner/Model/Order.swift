//
//  Order.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 29/05/2024.
//

import Foundation

class Order {
    private(set) var items = [MenuItem]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        }
        return 0
    }

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items.remove(at: index)
    }
}
