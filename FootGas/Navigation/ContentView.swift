//
//  ContentView.swift
//  FootGas
//
//  Created by Foppe on 2022-04-15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    @SceneStorage("selection") var selection: TranscodingJob.ID?
    var body: some View {
        VStack {
            NavigationView {
                Sidebar(selection: $selection)
                JobEditor(selection: $selection)
            }
            Text("Logging should go here")
                .frame(height: 100)
        }.frame(minHeight: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store())
    }
}

struct Sidebar: View {
    
    @EnvironmentObject var store: Store
    
    @Binding var selection: TranscodingJob.ID?
    
    var body: some View {
        if (!store.jobs.isEmpty) {
            Text("Transcoding Jobs")
            List(store.jobs, selection: $selection) {
                job in
                Label(job.inputUrl, systemImage: "video.square")
            }.frame(minWidth: 250)
        } else {
            VStack {
                AddJobButton()
            }
        }
    }
}
