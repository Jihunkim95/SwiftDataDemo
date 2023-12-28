//
//  ToDoItem.swift
//  SwiftDataDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI
import SwiftData

// 앱의 데이터 모델을 생성
// @Model : SwiftData는 자동으로 데이터 클래스에 대한 지속성을 활성화
@Model
final class ToDoItem: Identifiable {
    var id: UUID
    var name: String
    var isComplete: Bool
    
    init(id: UUID, name: String, isComplete: Bool) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
    }
}
