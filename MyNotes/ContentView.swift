//
//  ContentView.swift
//  MyNotes
//
//  Created by PRO M1 2020 8/256 on 06/08/23.
//

import SwiftUI

struct ContentView: View {
    let notes = ["Notes 1", "Notes 2", "Notes 3"]
    
    var body: some View {
        NavigationView {
            VStack {
                Image("background-1")
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 25)
                List(notes, id: \.self) {note in
                    NavigationLink(
                        destination: plusButton,
                        label: {
                            VStack(alignment: .leading, spacing: 4) {
                                        Text("Hello World!")
                                        Text("Hai!")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.vertical, 16)
                    })
                }
                .listStyle(.inset)
            }
            .navigationTitle("My Notes")
            .navigationBarItems(trailing: plusButton)
        }
    }

    
    var plusButton: some View {
        Button(action: {
//            isPresentedNewPost.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
