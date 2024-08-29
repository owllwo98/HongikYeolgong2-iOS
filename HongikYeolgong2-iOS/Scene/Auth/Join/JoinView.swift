
import SwiftUI

struct JoinView: View {
    @State private var text = ""
    @State private var text2 = ""
    @State private var seletedItem = ""
    @StateObject private var joinViewModel = JoinViewModel()
    
    var body: some View {
        let nicknameBinding = Binding<String>(get: {
            joinViewModel.nickname
        }, set: {
            joinViewModel.send(action: .inputNickname($0))
        })
        
        let pickerBinding = Binding<String>(get: {
            joinViewModel.departmentName
        }, set: {
            joinViewModel.send(action: .seletedDepartment($0))
        })
        
        VStack(spacing: 0) {
            Spacer().frame(height: 23)
            
            // 닉네임
            HStack {
                Text("닉네임")
                    .font(.pretendard(size: 16, weight: .bold))
                    .foregroundStyle(.gray200)
                Spacer()
            }
            
            Spacer().frame(height: 8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 10) {
                    VStack {
                        CustomTextField(text: nicknameBinding,
                                        placeholder: "닉네임을 입력해주세요.",
                                        isError: joinViewModel.nicknameStatus.isError)
                        .frame(width: 213)
                    }
                    
                    CustomButton(title: "중복확인",
                                 style: .rounded) {
                    }
                    .disabled(joinViewModel.buttonDisable)
                    .opacity(joinViewModel.buttonDisable ? 0.7 : 1)
                }
                
                Text(joinViewModel.nicknameStatus.message)
                    .font(.pretendard(size: 12, weight: .regular))
                    .foregroundStyle(joinViewModel.nicknameStatus.textColor)
            }
            
            Spacer().frame(height: 12)
            
            // 학과
            HStack {
                Text("학과")
                    .font(.pretendard(size: 16, weight: .bold))
                    .foregroundStyle(.gray200)
                Spacer()
            }
            
            Spacer().frame(height: 8)
            
            Picker(text: $joinViewModel.departmentName,
                   seletedItem: pickerBinding,
                   placeholder: "학과를 입력해주세요.",
                   items: joinViewModel.suggestions
            )
            
            Spacer()
            
            CustomButton(title: "가입하기",
                         style: .background(image: .angularButton02)) {
            }
        }
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
        
        .padding(.horizontal, 28)
        .customNavigation(left: {
            Text("회원가입")
                .font(.suite(size: 18, weight: .semibold))
                .foregroundStyle(.gray100)
        })
    }
}
