//
//  ContentView.swift
//  Notes
//
//  Created by Bilal Dallali on 27/08/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var notes = [Note]()
    
    @State var showAdd = false
    
    var body: some View {
        NavigationView {
            List(self.notes) { note in
                Text(note.note)
                    .padding()
            }
            .sheet(isPresented: $showAdd, content: {
                AddNoteView()
            })
            .onAppear(perform: {
                fetchNotes()
            })
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                self.showAdd.toggle()
            }, label: {
                Text("Add")
            }))
        }
    }
    
    func fetchNotes() {
        let url = URL(string: "http://localhost:3000/notes")!
        
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data else { return }
            
            do {
                let notes = try JSONDecoder().decode([Note].self, from: data)
                print(notes)
                self.notes = notes
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct Note: Identifiable, Codable {
    var id: String { _id }
    var _id: String
    var note: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
