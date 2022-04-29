//
//  JobEditor.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import SwiftUI

struct JobEditor: View {
    @EnvironmentObject var store: Store
    
    @Binding var selection: TranscodingJob.ID?
    
    var body: some View {
        VStack {
            Text(job.fileName)
                .font(.title)
                .padding()
            Text("File path: \(job.inputUrl)")
            Text("Job id: \(job.id.uuidString)")
        }.frame(minWidth: 450)
    }
}

struct JobEditor_Previews: PreviewProvider {
    static var store = Store()
    static var previews: some View {
        JobEditor(selection: .constant(store.jobs.first!.id))
            .environmentObject(store)
    }
}

extension JobEditor {
    var job: TranscodingJob {
        store[selection]
    }
    
    var jobBinding: Binding<TranscodingJob> {
        $store[selection]
    }
}
