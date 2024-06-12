//
//  CheckoutView.swift
//  Fancy Diner
//
//  Created by Sylvan Ash on 12/06/2024.
//

import SwiftUI

struct CheckoutView: View {
    enum PaymentType: String, CaseIterable {
        case cash = "Cash"
        case card = "Credit Card"
        case dinerPointers = "Diner Points"
    }

    @EnvironmentObject var order: Order
    @State private var paymentType: PaymentType = .cash
    @State private var addLoyaltyPoints = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 10

    private let paymentTypes: [PaymentType] = PaymentType.allCases
    private let tipAmounts = [0, 10, 15, 20, 25]

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) { 
                    ForEach(paymentTypes, id: \.self) {
                        Text($0.rawValue)
                    }
                }

                Toggle("Add Fancy Diner loyalty card?", isOn: $addLoyaltyPoints.animation())

                if addLoyaltyPoints {
                    TextField("Enter your Fancy Diner ID", text: $loyaltyNumber)
                }
            }

            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("Total: $100") {
                Button("Confirm order") {
                    //
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
