// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  AddGroupPopup.swift
//  ShoppingListApp
//


import Foundation
import SwiftUI

struct AddGroupPopup: View {
    @EnvironmentObject var viewModel: ShoppingListViewModel
    @State private var groupName: String = ""

    var body: some View {
        VStack {
            Text("Add Group")
                .font(.titleFont)
                .padding()
            TextField("Name of your Group", text: $groupName)
                .padding()
            HStack {
                Button("Cancel") {
                    viewModel.showingAddGroupPopup = false
                }
                .padding()
                Spacer()
                Button("Create") {
                    if !groupName.isEmpty {
                        viewModel.addGroup(name: groupName)
                        viewModel.showingAddGroupPopup = false
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

// Updated preview provider
struct AddGroupPopup_Previews: PreviewProvider {
    static var previews: some View {
        
        AddGroupPopup()
            .environmentObject(ShoppingListViewModel())
    }
}
