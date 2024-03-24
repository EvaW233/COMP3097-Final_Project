// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  Item.swift
//  ShoppingListApp
//


import Foundation

struct Item: Identifiable, Codable {
    let id: UUID
    var name: String
    var price: Double
    var quantity: Int
    var note: String?

    init(id: UUID = UUID(), name: String, price: Double, quantity: Int = 1, note: String? = nil) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
        self.note = note
    }
}
