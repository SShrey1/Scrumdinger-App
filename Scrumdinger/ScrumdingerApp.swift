//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by user@59 on 16/10/24.
//

import SwiftUI


@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper : ErrorWrapper?


    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load data and continue.")
                }
            }
            .sheet(item : $errorWrapper){
                store.scrums = DailyScrum.sampleData
            }content : { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
