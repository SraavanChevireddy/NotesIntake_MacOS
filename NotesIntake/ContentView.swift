//
//  ContentView.swift
//  NotesIntake
//
//  Created by Sraavan Chevireddy on 26/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showPass: Bool = false
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("Hey!")
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            EditorView()
                .onOpenURL { url in
                    print("The url is \(url)")
                    showPass = url.absoluteString.contains("pass")
                }.sheet(isPresented: $showPass) {
                    Image("lollipop")
                        .cornerRadius(12)
                }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


