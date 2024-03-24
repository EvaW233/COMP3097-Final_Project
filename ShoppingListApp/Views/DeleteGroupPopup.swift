// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  DeleteGroupPopup.swift
//  ShoppingListApp


import Foundation
import SwiftUI

struct DeleteGroupPopup: View {
    @EnvironmentObject var viewModel: ShoppingListViewModel
    @State private var selectedGroupID: UUID?

    var body: some View {
        VStack {
            Text("Delete Group")
                .font(.titleFont)
                .padding()

            Picker("Select a group", selection: $selectedGroupID) {
                ForEach(viewModel.groups) { group in
                    Text(group.name).tag(group.id)
                }
            }
            .padding()

            HStack {
                Button("Cancel") {
                    viewModel.showingDeleteGroupPopup = false
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()

                Button("Delete") {
                    if let groupID = selectedGroupID, let index = viewModel.groups.firstIndex(where: { $0.id == groupID }) {
                        viewModel.deleteGroup(at: IndexSet(integer: index))
                        viewModel.showingDeleteGroupPopup = false
                    }
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct DeleteGroupPopup_Previews: PreviewProvider {
    static var previews: some View {
        DeleteGroupPopup()
            .environmentObject(ShoppingListViewModel())
    }
}
