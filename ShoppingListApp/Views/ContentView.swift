// Project Prototype - Comp 3097
// Students:
// - Luis Rodrigo Procopio Andrada (101356043)
// - Eva Wang (101381503)
// - Koichi Kumo (101354361)

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShoppingListViewModel()

    var body: some View {
        NavigationView {
            ShoppingListHomeView()
                .environmentObject(viewModel)
        }
        .sheet(isPresented: $viewModel.showingAddItemPopup) {
            AddItemPopup()
                .environmentObject(viewModel)
        }
        .sheet(isPresented: $viewModel.showingAddGroupPopup) {
            AddGroupPopup()
                .environmentObject(viewModel)
        }
        .sheet(isPresented: $viewModel.showingDeleteGroupPopup) {
            DeleteGroupPopup()
                .environmentObject(viewModel)
        }
        .sheet(isPresented: $viewModel.showingLaunchScreen) {
            LaunchScreenView() 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
