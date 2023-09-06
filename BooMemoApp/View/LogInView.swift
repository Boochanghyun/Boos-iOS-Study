import SwiftUI

struct LogInView: View {
    @State private var username = ""
    //상태
    @State private var password = ""
    @State private var usernameWrong = 0
    @State private var passwordWrong = 0
    @State private var showingLogInScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack{
                    
                    HStack{
                        Rectangle()
                            .frame(width: 105, height: 105)
                            .blur(radius: 3)
                            .padding(.top, 55)
                            .padding(.leading, 30)
                            .foregroundColor(Color(hue: 0.94, saturation: 0.987, brightness: 0.836, opacity: 0.733))
                            
                        
                        
                    }
                    Spacer()
                }
//사각형 부분
                VStack{
                    
                    HStack{
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .blur(radius: 3)
                            .padding(.top, 50)
                            
                            
                        
                        
                    }
                    Spacer()
                }
//사각형 부분
                VStack {
                    HStack {
                        Spacer()
                        
                        Image("풍선")
                            .resizable()
                            .padding(.top, 10)
                            .frame(width: 232,height: 250)
                            .padding(.top, 40)
                        
                    }
                    Spacer()
                }
//이미지 부분
                VStack {
                    Spacer()
                    Text("Boo Memo App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                    Spacer()
                    Image("BooLOGO")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .padding(.bottom, 45)
                }
//텍스트와 이미지
                VStack() {
                    
                    Spacer()
                    
                    
                    
                    Spacer()
                    
                    
                    TextField("User ID", text: $username)
                    //$를 사용, 상태를 나타내는 바인딩. 위에 @state에서 ""으로 설정된 값이 현 텍스트필드에서 입력된 값으로 업데이트 됨->뷰에 표시
                        .padding()
                        .frame(width: 340, height: 60)
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 1.1, opacity: 0.4))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                        .border(Color(hue: 0.9, saturation: 0.99, brightness: 0.8, opacity: 0.7), width: CGFloat(usernameWrong))
                       
                    
                    SecureField("Password", text: $password)
                    //위 유저 네임과 같은 원리, SECURE필드 사용으로 점으로 표시됨
                        .padding()
                        .frame(width: 340, height: 60)
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 1.1, opacity: 0.4))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .border(Color(hue: 0.9, saturation: 0.99, brightness: 0.8, opacity: 0.7), width: CGFloat(passwordWrong))
                        .padding()
                        
                    Button("Log In") {
                        authenticateUser(username: username, password: password)//버튼 기능, 밑의 func에서 정의
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                    .frame(width: 340, height: 55)
                    .background(Color(hue: 0.94, saturation: 0.987, brightness: 0.836, opacity: 0.733))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    NavigationLink("", destination: MainListView(), isActive: $showingLogInScreen)
                    //네비게이션 링크를 사용하여 MainListView로 연결
                    //활성화가 되면 showingloginscreen이 true로 변경됨
                        .opacity(0) // NavigationLink를 화면에서 보이지 않도록 하기 위해 투명하게 설정
                    
                        .padding(.bottom, 40)
                    Text("From Boo Inc.")
                }
            }
        }
        .navigationBarHidden(true)//네비게이션 바 안보이게 처리
    }
    
    func authenticateUser(username: String, password: String)
    //유저네임, 패스워드를 스트링으로 받아오겠다
    {
        if username.lowercased() == "boosbooth01" {
            usernameWrong = 0//lowercased-> 소문자로 바꿔서 가져오는거
        }else {
            usernameWrong = 2}
            if password.lowercased() == "qcg010916@" {
                passwordWrong = 0
                showingLogInScreen = true
                // 화면 전환
            }else {
                passwordWrong = 2
            }
     
            
        }
       
        }
    


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

