//
//  BooMemoAppApp.swift
//  BooMemoApp
//
//  Created by 부창현 on 2023/08/25.
//

import SwiftUI

@main
struct BooMemoAppApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LogInView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
