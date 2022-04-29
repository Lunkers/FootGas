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
    
    var table: some View {
        Table(streams) {
            TableColumn("StreamType", value: \.codec_type!)
            TableColumn("Codec", value: \.codec_name!)
            TableColumn("Bitrate", value:\.bit_rate!)
        }
    }
    
    var body: some View {
        VStack {
            Text(job.fileName)
                .font(.title)
                .padding()
            Text("File path: \(job.inputUrl)")
            Text("Job id: \(job.id.uuidString)")
            table
                .navigationTitle(job.fileName)
        }
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
    
    var streams: [Stream] {
        return job.streams
    }
}
