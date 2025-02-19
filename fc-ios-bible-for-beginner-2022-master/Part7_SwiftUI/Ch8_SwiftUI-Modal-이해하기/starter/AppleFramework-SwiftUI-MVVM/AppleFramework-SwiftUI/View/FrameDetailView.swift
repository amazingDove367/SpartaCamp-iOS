//
//  FrameDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by Hakyung Sohn on 11/12/24.
//

import SwiftUI

struct FrameDetailView: View {
    
    @StateObject var viewModel: FrameDetailViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // @Environment(\.dismiss) var dismiss: DismissAction // presentationMode 대체
    
    /// @Environment : 환경변수. 애플 시스템에서 정의해 놓음
    /// @Environment ./presentationMode
    //  - 앞의 뷰에서 modality(sheet)/full screen 띄우면, presentationMode 가 바인딩 되어 넘어오는 것
    //      예시) presentationMode.wrappedValue.dissmiss()
    //  - .presentationMode : @Environment 환경변수 내 정의 되어있는 모드
    //  - var presentationMode 는, FrameworkListViewModel isPresented 와 mapping 되어있다.
    //    >> isPresented = false 해도 dismiss 됨!! (그러나, 앞/뒤 view 에 의존성(dependency)가 생기기에 환경변수 사용
    /// @EnvironmentObject : 커스텀으로 만든 객체를 삽입할 때 사용
    
    var body: some View {
        
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text(viewModel.framework.name)
                .font(.system(size: 22, weight: .bold))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            Button(action: {
                // dismiss() // presentationMode 대체
                // presentationMode.wrappedValue.dismiss() // 환경변수 @Environment 사용!!! >> isPresented: $viewModel.isPresented 를 또 만들기에는, dependency 가 생기니..
                
                viewModel.isSafariPresented = true
            }, label: {
                Text("Learn More")
                    .font(.system(size: 18, weight: .bold))
            })
            .frame(maxWidth: .infinity, maxHeight: 64)
            .foregroundColor(.white)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .sheet(isPresented: $viewModel.isSafariPresented) {
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
            
//            presentationMode.wrappedValue.dismiss() // 만약, .sheet이 아닌, fullScreenCover 화면일 경우; 버튼을 통해 환경변수로 dismiss 할 경우
        }
        /// presentationMode의 value 를 확인하고 싶을 때 - onAppear / onDisappear
        .onAppear() { // view 가 열렸을때
            print("safari onAppear \(presentationMode.wrappedValue.isPresented)")
        }
        .onDisappear() { // view 가 닫혔을때
            print("safari onDisappear \(presentationMode.wrappedValue.isPresented)")
        }
    }
}

#Preview {
    FrameDetailView(viewModel: FrameDetailViewModel(framework: AppleFramework.list[0]))
        .previewLayout(.fixed(width: 160, height: 250))
}
