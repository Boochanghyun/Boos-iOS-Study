//
//  ComposeView.swift
//  BooMemoApp
//
//  Created by 부창현 on 2023/08/25.
//

import SwiftUI
import UIKit


struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment (\.dismiss) var dismiss
    
    @State private var content: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if content.isEmpty {
                        Text("Write your diary here ")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer()
                    }}
             
                TextEditor(text: $content)//$를 붙여서 content속성을 전달함, 이렇게 하면 콘텐츠 속성과 에디터가 바인딩 됨
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "Edit Diary" : "New Diary")
            .navigationBarTitleDisplayMode(.automatic)
            //네비게이션 바에 버튼을 추가할 때는 툴바를 사용
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color.primary)//다크, 라이트 모드에서 색 바꾸는 법!!!!!!!
                     
                    
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                        Button {
                            if let memo = memo {
                                store.update(memo: memo, contnet: content)
                            } else {
                                store.insert(memo: content)

                            }
                            dismiss()
                        } label: {
                            Text("Save")
                                .font(.system(size: 13))
                                .fontWeight(.bold)
                                .padding(.horizontal, 15)//이건 왜?->글자와 프레임 사이 공간 추가
                                .padding(.vertical, 7)
                            
                                .background(Color(hue: 0.94, saturation: 0.987, brightness: 0.836, opacity: 0.733))
                                .foregroundColor(Color.white)
                                .cornerRadius(25)//원래는 clipshape rectangle썼는데 이걸로 변경함
                                .shadow(radius: 5)
                        }
                        
                    
                }
            }
        }
    }
    
    struct ComposeView_Previews: PreviewProvider {
        static var previews: some View {
            ComposeView()
                .environmentObject(MemoStore())
        }
    }
}
