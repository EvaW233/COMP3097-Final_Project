// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  ShoppingListHomeView.swift
//  ShoppingListApp


import SwiftUI

struct ShoppingListHomeView: View {
    @EnvironmentObject var viewModel: ShoppingListViewModel
    @State private var showingAddItemPopup = false
    @State private var showingAddGroupPopup = false
    @State private var showingDeleteGroupPopup = false
    @State private var selectedItem: Item?

    var body: some View {
        NavigationView {
            VStack {
                topBar
                groupsList
            }
            .navigationTitle("Shopping List")
        }
        .sheet(isPresented: $showingAddItemPopup) {
            AddItemPopup()
        }
        .sheet(isPresented: $showingAddGroupPopup) {
            AddGroupPopup()
        }
        .sheet(isPresented: $showingDeleteGroupPopup) {
            DeleteGroupPopup()
        }
        .sheet(item: $selectedItem) { item in
            AboutItemView(item: item)
        }
    }

    private var topBar: some View {
        HStack {
            Button("Create Group") {
                showingAddGroupPopup = true
            }
            .font(.buttonFont)
            .foregroundColor(.white)
            .padding()
            .background(Color.darkGreen)
            .cornerRadius(10)

            Spacer()

            Button("Delete Group") {
                showingDeleteGroupPopup = true
            }
            .font(.buttonFont)
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.darkGray)
    }

    private var groupsList: some View {
        List {
            ForEach(viewModel.groups) { group in
                Section(header: Text(group.name).foregroundColor(.white).padding().background(Color.purple)) {
                    ForEach(group.items) { item in
                        itemRow(for: item, in: group)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let itemID = group.items[index].id
                            viewModel.deleteItem(group.items[index].id, from: group.id)

                        }
                    }

                    Button("Add Items") {
                        showingAddItemPopup = true
                    }
                    .padding()
                    .background(Color.darkGreen)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
            .onDelete { indexSet in
                viewModel.deleteGroup(at: indexSet)
            }
        }
    }

    private func itemRow(for item: Item, in group: ProductGroup) -> some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("$\(item.price, specifier: "%.2f") x\(item.quantity)")
        }
        .onTapGesture {
            selectedItem = item
        }
    }
}

struct ShoppingListHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListHomeView().environmentObject(ShoppingListViewModel())
    }
}
