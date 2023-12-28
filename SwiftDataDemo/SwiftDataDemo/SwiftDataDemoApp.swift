//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var sharedModelContainer: ModelContainer = {
        
        //새로 생성한 데이터 스키마 추가
        let schema = Schema([
            Item.self,
            ToDoItem.self
            
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            ToDoItemView()
        }
        .modelContainer(sharedModelContainer)
    }
}
