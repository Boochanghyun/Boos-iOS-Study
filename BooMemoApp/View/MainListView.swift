import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    
    @State private var showComposer: Bool = false
    @State private var scrollToTop: Bool = false // 추가된 부분
        //@state의 역할은?
    var body: some View {
        NavigationView {
     
           
                List {
                   
                    ForEach(store.list) { memo in
                        NavigationLink {
                            DetailView(memo: memo)
                        } label: {
                            MemoCell(memo: memo)
                        }
                    }
                    .onDelete(perform: store.delete)
                }
            
                .listStyle(.plain)
                .navigationTitle("Diary")
                .multilineTextAlignment(.leading)
                .id(scrollToTop) // 추가된 부분
                
                
                .toolbar {
                    ToolbarItem {
                        VStack {
                            
                            HStack(spacing: 115) {
                             
                                Button(action: {
                                    withAnimation(.default){
                                    scrollToTop.toggle() // 버튼을 누를 때 맨 위로 스크롤
                                }
                                }) {
                                    Image("BooLOGO")
                                        .resizable()
                                        .frame(width: 120, height: 120, alignment: .center)
                                                                        }
                                
                              Spacer()
                            
                                    
                            }
                            Spacer()
                        }
                    }
                }
                
                .sheet(isPresented: $showComposer) {
                    ComposeView()
            }
                .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    // 버튼을 누를 때의 액션
                                    showComposer = true
                                }) {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding()//이건 왜?
                                        .background(Color(hue: 0.94, saturation: 0.987, brightness: 0.836, opacity: 0.733))
                                        .foregroundColor(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                }
                                .padding(.trailing, 20)//오른쪽 끝에서 떨어진 정도
                                .padding(.bottom, 50)//밑에서 떨어진 정도
                            }
                        }
                    )
          
        }
        .navigationViewStyle(.stack)
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
