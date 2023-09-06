//
//  MemoStore.swift
//  BooMemoApp
//
//  Created by 부창현 on 2023/08/25.
//메모 목록을 저장하는 class

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now ),
            Memo(content: "부창현", insertDate: Date.now ),

            Memo(content: "류창휘", insertDate: Date.now ),
            Memo(content: "홍유정", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "김사랑", insertDate: Date.now.addingTimeInterval(3600 * -48)),
            Memo(content: "아요", insertDate: Date.now ),
            Memo(content: "좋아요", insertDate: Date.now ),
            Memo(content: "테일러", insertDate: Date.now ),
            Memo(content: "스위프트", insertDate: Date.now ),
            Memo(content: "맥모닝", insertDate: Date.now ),
            Memo(content: "좋아요", insertDate: Date.now ),
   
            
        ]
    }
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)//새로운 메모는 항상 0번 인덱스에 추가하는 코드
    }
    func update(memo: Memo?, contnet: String) {
        guard let memo = memo else {
            return
        }
        memo.content = contnet
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    func delete(set: IndexSet) {
        for index in set{
            list.remove(at: index)
        }
    }
}
