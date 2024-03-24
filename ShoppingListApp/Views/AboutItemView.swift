// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  AboutItemView.swift
//  ShoppingListApp
//


import Foundation
import SwiftUI

struct AboutItemView: View {
    var item: Item

    var body: some View {
        VStack {
            Text("About \(item.name)")
                .font(.title)
                .padding()

            Text("Price: \(String(format: "%.2f", item.price))")
                .padding()

            Text("Quantity: \(item.quantity)")
                .padding()

            if let note = item.note, !note.isEmpty {
                Text("Note: \(note)")
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}

struct AboutItemView_Previews: PreviewProvider {
    static var previews: some View {
        AboutItemView(item: Item(name: "Sample", price: 1.99, quantity: 1, note: "A sample item"))
    }
}
