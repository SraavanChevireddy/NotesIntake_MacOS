//
//  EditorView.swift
//  NotesIntake
//
//  Created by Sraavan Chevireddy on 26/10/23.
//

import SwiftUI

struct EditorView: View {
    @State private var notes: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("New Notes")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                Text(Date(), style: .date)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
        }
        TextEditor(text: $notes)
            .textEditorStyle(.automatic)
    }
}

#Preview {
    EditorView()
}
