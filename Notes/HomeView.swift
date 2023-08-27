//
//  ContentView.swift
//  Notes
//
//  Created by Bilal Dallali on 27/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(0..<9) { i in
                Text("Numéro \(i)")
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                print("Add a note")
            }, label: {
                Text("Add")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
