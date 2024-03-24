// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  ShoppingListViewModel.swift
//  ShoppingListApp
//


import Foundation

class ShoppingListViewModel: ObservableObject {
    @Published var groups: [ProductGroup] = []
    @Published var taxRate: Double = 0.13 // Example tax rate, can be adjusted
    @Published var showingAddItemPopup = false
    @Published var showingAddGroupPopup = false
    @Published var showingDeleteGroupPopup = false
    @Published var showingLaunchScreen = true

    init() {
        
        let sampleItems = [
            Item(name: "Milk", price: 2.99, quantity: 1),
            Item(name: "Bread", price: 1.99, quantity: 2)
        ]
        let sampleGroup = ProductGroup(name: "Groceries", items: sampleItems)
        groups = [sampleGroup]
    }

    // MARK: Group management

    func addGroup(name: String) {
        let newGroup = ProductGroup(name: name)
        groups.append(newGroup)
    }

    func deleteGroup(at indexSet: IndexSet) {
        groups.remove(atOffsets: indexSet)
    }

    // MARK: Item management

    func addItem(_ newItem: Item, to groupID: UUID) {
        guard let index = groups.firstIndex(where: { $0.id == groupID }) else { return }
        groups[index].items.append(newItem)
    }

    func updateItem(_ item: Item, in groupID: UUID) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == groupID }),
              let itemIndex = groups[groupIndex].items.firstIndex(where: { $0.id == item.id }) else { return }
        groups[groupIndex].items[itemIndex] = item
    }

    func deleteItem(_ itemID: UUID, from groupID: UUID) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == groupID }),
              let itemIndex = groups[groupIndex].items.firstIndex(where: { $0.id == itemID }) else { return }
        groups[groupIndex].items.remove(at: itemIndex)
    }

// MARK: Quantity management

    func increaseQuantity(of itemID: UUID, in groupID: UUID) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == groupID }),
              let itemIndex = groups[groupIndex].items.firstIndex(where: { $0.id == itemID }) else { return }
        groups[groupIndex].items[itemIndex].quantity += 1
    }

    func decreaseQuantity(of itemID: UUID, in groupID: UUID) {
        guard let groupIndex = groups.firstIndex(where: { $0.id == groupID }),
              let itemIndex = groups[groupIndex].items.firstIndex(where: { $0.id == itemID }),
              groups[groupIndex].items[itemIndex].quantity > 1 else { return }
        groups[groupIndex].items[itemIndex].quantity -= 1
    }

    // MARK: Financial calculations

    func totalPriceForItem(item: Item) -> Double {
        return Double(item.quantity) * item.price
    }

    func totalPriceForGroup(groupID: UUID) -> Double {
        guard let group = groups.first(where: { $0.id == groupID }) else { return 0.0 }
        return group.items.reduce(0) { $0 + totalPriceForItem(item: $1) }
    }

    func totalPriceWithTax(for groupID: UUID) -> Double {
        let subtotal = totalPriceForGroup(groupID: groupID)
        return subtotal * (1 + taxRate)
    }

    func grandTotalPrice() -> Double {
        groups.reduce(0) { $0 + totalPriceWithTax(for: $1.id) }
    }
}
