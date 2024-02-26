// UI SUBMISSION - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var showingAddItemPopup = false
    @State private var showingAddGroupPopup = false
    @State private var showingDeleteGroupPopup = false 
    @State private var groups = ["Group 1", "Group 2"]

    var body: some View {
        ShoppingListHomeView()
            .sheet(isPresented: $showingAddItemPopup) {
                AddItemPopup(showingAddItemPopup: $showingAddItemPopup)
            }
            .sheet(isPresented: $showingAddGroupPopup) {
                AddGroupPopup(showingAddGroupPopup: $showingAddGroupPopup)
            }

            .sheet(isPresented: $showingDeleteGroupPopup) {
                DeleteGroupPopup(groups: $groups, showingDeleteGroupPopup: $showingDeleteGroupPopup)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AboutItemView: View {
    var item: Item
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About \(item.name)")
                .font(.headline)
                .padding(.top)

            Text("Price: \(item.price, specifier: "%.2f")")
            Text("Note: \(item.note ?? "No notes")")

            Spacer()

            Button("Go Back") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Item Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
