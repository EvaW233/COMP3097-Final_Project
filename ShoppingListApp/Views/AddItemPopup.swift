// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  AddItemPopup.swift
//  ShoppingListApp
//


import Foundation
import SwiftUI

struct AddItemPopup: View {
    @EnvironmentObject var viewModel: ShoppingListViewModel
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @State private var itemNote: String = ""
    
    var body: some View {
        VStack {
            Text("Add item")
                .font(.titleFont)
                .padding()
            TextField("Item name", text: $itemName)
                .padding()
            TextField("Price", text: $itemPrice)
                .padding()
            TextField("Note", text: $itemNote)
                .padding()
            HStack {
                Button("Cancel") {
                    viewModel.showingAddItemPopup = false
                }
                .padding()
                Spacer()
                Button("Confirm") {
                    if let price = Double(itemPrice), !itemName.isEmpty {
                        let newItem = Item(name: itemName, price: price, note: itemNote)
                        
                        if let groupID = viewModel.groups.first?.id {
                            viewModel.addItem(newItem, to: groupID)
                            viewModel.showingAddItemPopup = false
                        }
                    }
                       
                }
            }
            .padding()
        }
    }
    
    struct AddItemPopup_Previews: PreviewProvider {
        static var previews: some View {
            AddItemPopup()
                .environmentObject(ShoppingListViewModel())
        }
    }
}
