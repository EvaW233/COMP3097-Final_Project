// UI SUBMISSION - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  TaxCalculatorView.swift
//  ShoppingListApp
//
//  Created by Eva Wang on 2024-02-25.
//

import SwiftUI

struct TaxCalculatorView: View {
    @State private var itemPrice: String = ""
    @State private var totalPriceWithTax: Double = 0.0

    var body: some View {
        VStack {
            TextField("Enter item price", text: $itemPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if let price = Double(itemPrice) {
                    totalPriceWithTax = price * 1.13 // Assuming 13% tax
                }
            }) {
                Text("Calculate Total with Tax")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text("Total Price with Tax: $\(totalPriceWithTax, specifier: "%.2f")")
                .padding()

            Spacer()
        }
        .navigationTitle("Tax Calculator")
    }
}

struct TaxCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TaxCalculatorView()
    }
}
