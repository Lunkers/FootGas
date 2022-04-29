//
//  AddJobButton.swift
//  FootGas
//
//  Created by Fredrik Lundkvist on 2022-04-29.
//

import SwiftUI

struct AddJobButton: View {
    @EnvironmentObject var store: Store
    @State var filename = "Select a file"
    @State var showFileSelector: Bool = false
    var body: some View {
        VStack {
            Text(filename)
            Button("Add job") {
                showFileSelector.toggle()
                let panel = NSOpenPanel()
                panel.allowsMultipleSelection = false
                if panel.runModal() == .OK {
                    self.filename = panel.url?.lastPathComponent ?? "No file selected"
                    do {
                        try
                        store.addTranscodingJob(url: panel.url, fileName: panel.url?.lastPathComponent ?? "Invalid filename")
                    } catch {
                        self.filename = "Error when adding file"
                    }
                }
            }
            .padding()
        }.frame(minWidth: 100)
    }
}

struct AddJobButton_Previews: PreviewProvider {
    static var previews: some View {
        AddJobButton()
    }
}

