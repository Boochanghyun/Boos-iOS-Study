//
//  DetailView.swift
//  BooMemoApp
//
//  Created by 부창현 on 2023/08/25.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    //메모.swift에서 observable로 세팅했고 여기서 옵저브드를 써서 변경될 때마다 업데이트가 되는것
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    
    
    @State private var showDeleteAlert = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                        
                    }
                    Text(memo.insertDate, style: .date)
                        .font(.footnote)
                        .padding()
                        .foregroundColor(.secondary)
                    
                    
                }
            }
        }
        .navigationTitle("View Memo")
        .navigationBarTitleDisplayMode(. inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                        .shadow(radius: 5)
             
                }
                .foregroundColor(Color(hue: 0.94, saturation: 0.987, brightness: 0.836, opacity: 0.733))
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss() 
                    } label: {
                        Text("Delete")
                    }
                    }message: {
                        Text("메모를 삭제할까요?")

                    }
                    Button {
                        showComposer = true
                    } label: {
                        Text("Edit")
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
            .sheet(isPresented: $showComposer) {
                ComposeView(memo: memo)
            }
        }
    }

    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                DetailView(memo: Memo(content: "Hello"))
                    .environmentObject(MemoStore())
            }
        }
    }

