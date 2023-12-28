//
//  ToDoItemView.swift
//  SwiftDataDemo
//
//  Created by 김지훈 on 2023/12/28.
//

import SwiftUI
import SwiftData

struct ToDoItemView: View {
    
    // @Query 속성은 필요한 데이터를 자동으로 가져옴
    // ToDoItem 인스턴스를 가져오도록 지정
    @Query private var todoItems: [ToDoItem]
    
    // 모델 컨텍스트를 얻어오는 변수를 선언
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(todoItems) { todoItem in
                    HStack{
                        Text(todoItem.name)
                        Spacer()
                        if todoItem.isComplete{
                            Image(systemName: "checkmark")
                        }
                    }
                }
                // 삭제할 항목의 인덱스를 저장하는 인덱스 세트 사용
                .onDelete{ indexSet in
                    for index in indexSet{
                        modelContext.delete(todoItems[index])
                    }
                    
                }
            }
            .navigationTitle("To Do List")
            // 임의의 할 일 항목을 추가하기 위한 도구 모음 버튼을 추가
            .toolbar {
                Button("", systemImage: "plus"){
                    modelContext.insert( generateRandomTodoItem() )
                }
            }
        }
    }
}

// SwiftData 및 인메모리 컨테이너로 미리보기
// 컨테이너 데이터가 채워져 있지 않으면 미리보기에는 빈 Todo 목록만 표시
#Preview {
    ToDoItemView()
//        .modelContainer(for: ToDoItem.self)
        // 미리보기 컨테이너를 사용
        .modelContainer(previewContainer)
}
