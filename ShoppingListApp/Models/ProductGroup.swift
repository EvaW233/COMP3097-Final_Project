// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  ProductGroup.swift
//  ShoppingListApp


import Foundation

struct ProductGroup: Identifiable, Codable {
    let id: UUID
    var name: String
    var items: [Item]

    init(id: UUID = UUID(), name: String, items: [Item] = []) {
        self.id = id
        self.name = name
        self.items = items
    }
}
