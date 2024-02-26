// UI SUBMISSION - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

//  ShoppingListHomeView.swift
//  ShoppingListApp


import Foundation
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var note: String?
}
struct ShoppingListHomeView: View {
    @State private var showingAddItemPopup = false
    @State private var showingAddGroupPopup = false
    @State private var showingDeleteGroupPopup = false
    @State private var showingLaunchScreen = true
    @State private var groups = ["Group 1", "Group 2"]
    @State private var selectedItem: Item?

    var body: some View {
        NavigationView {
            VStack {
                // Top Bar with Title and Buttons
                HStack {
                    Button(action: {
                        showingAddGroupPopup = true
                    }) {
                        Text("Create Group")
                            .font(.buttonFont)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.darkGreen)
                            .cornerRadius(4)
                    }
                    Spacer()
                    Button(action: {
                        showingDeleteGroupPopup = true
                    }) {
                        Text("Delete Group")
                            .font(.buttonFont)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                }
                .padding()
                .background(Color.darkGray)
                
                .sheet(isPresented: $showingLaunchScreen) {
                    LaunchScreenView()
                }
                .sheet(isPresented: $showingAddGroupPopup) {
                    AddGroupPopup(showingAddGroupPopup: $showingAddGroupPopup)
                }

                .sheet(isPresented: $showingDeleteGroupPopup) {
                    DeleteGroupPopup(groups: $groups, showingDeleteGroupPopup: $showingDeleteGroupPopup)
                }

                // Group 1 Section
                VStack(alignment: .leading) {
                    HStack {
                        Text("Group 1")
                            .font(.titleFont)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Price: $9.48")
                            .font(.bodyFont)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.purple)

                    // List of Items
                    ForEach(0..<2, id: \.self) { _ in
                        HStack {
                            Text("Item Name 1")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    selectedItem = Item(name: "Item Name", price: 10.0, note: "Sample note")
                                }
                            Spacer()
                            // Quantity Stepper
                            HStack {
                                Button(action: {
                                    // TODO: Decrease Quantity
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                Text("0")
                                    .font(.bodyFont)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                Button(action: {
                                    // TODO: Increase Quantity
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding()
                        .background(Color.lightPurple)
                    }

                    // Add Item Button
                    Button(action: {
                        showingAddItemPopup = true
                    }) {
                        HStack {
                            Spacer()
                            Text("Add Items")
                                .font(.buttonFont)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color.darkGreen)
                        .cornerRadius(4)
                    }
                    .padding(.top, 8)
                }
                .background(Color.darkerGray)
                .cornerRadius(8)
                .padding()

                Spacer()
            }
            .navigationTitle("Shopping List")
            .background(Color.darkerWhite)
            .sheet(isPresented: $showingAddItemPopup) {
                AddItemPopup(showingAddItemPopup: $showingAddItemPopup)
            }
            .sheet(item: $selectedItem) { item in
                AboutItemView(item: item)
            }
        }
    }
}


// dummy data for preview
struct ShoppingListHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListHomeView()
    }
}

struct AddItemPopup: View {
    @Binding var showingAddItemPopup: Bool
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @State private var itemNote: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add item")
                .font(.titleFont)
                .foregroundColor(.white)
            

            TextField("Item name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.purple)
                .foregroundColor(.darkGray)

            TextField("Price", text: $itemPrice)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.purple)
                .foregroundColor(.darkGray)

            TextField("Note", text: $itemNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.purple)
                .foregroundColor(.darkGray)

            HStack {
                Button("Cancel") {
                    self.showingAddItemPopup = false
                }
                .font(.buttonFont)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(0)

                Spacer()

                Button("Confirm") {
                    
                    self.showingAddItemPopup = false
                }
                .font(.buttonFont)
                .foregroundColor(.white)
                .padding()
                .background(Color.darkGreen)
                .cornerRadius(0)
            }
        }
        .padding()
        .background(Color.darkerGray)
        .cornerRadius(0)
    }
}

//add groups
struct AddGroupPopup: View {
    @State private var groupName: String = ""
    @Binding var showingAddGroupPopup: Bool // Make sure to bind this to your parent view

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add Group")
                .font(.titleFont)
                .foregroundColor(.black)
            
            TextField("Name of your Group", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.darkGray)
        
            
            HStack {
                Button("Cancel") {
                    showingAddGroupPopup = false // Dismiss the popup
                }
                .foregroundColor(.darkGreen)
                .font(.buttonTextFont)
                
                Spacer()
                
                Button("Create") {
                    // Handle group creation here
                    showingAddGroupPopup = false // Dismiss the popup
                }
                .foregroundColor(.darkGreen)
                .font(.buttonTextFont)
            }
        }
        .padding()
        .background(Color.darkerWhite)
        .cornerRadius(10)
    }
}

//delete group
struct DeleteGroupPopup: View {
    @Binding var groups: [String]
    @Binding var showingDeleteGroupPopup: Bool
    @State private var selectedGroup: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Delete Group")
                .font(.title)
                .foregroundColor(.black)

            Picker("Select a group", selection: $selectedGroup) {
                ForEach(groups, id: \.self) { group in
                    Text(group)
                }
            }

            .pickerStyle(WheelPickerStyle())

            // Buttons
            HStack {
                Button("Cancel") {
                    showingDeleteGroupPopup = false
                }
                .foregroundColor(.red)
                .font(.headline)

                Spacer()

                Button("Delete") {
                    
                    if !selectedGroup.isEmpty {
                        groups.removeAll { $0 == selectedGroup }
                        showingDeleteGroupPopup = false
                    }
                }
                .foregroundColor(.red)
                .font(.headline)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


