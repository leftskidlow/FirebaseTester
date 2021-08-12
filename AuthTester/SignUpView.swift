//
//  LoginView.swift
//  LoginView
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
  
  @State var email = ""
  @State var password = ""
  @EnvironmentObject var signInViewModel: SignInViewModel
  
  var body: some View {
    
    VStack {
      Image("login")
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 150)
      VStack {
        TextField("Email Address", text: $email)
          .padding()
          .background(Color.secondary)
          .cornerRadius(15)
        SecureField("Password", text: $password)
          .padding()
          .background(Color.secondary)
          .cornerRadius(15)
          Button {
            signInViewModel.signUp(email: email, password: password)
          } label: {
            Text("Create Account")
              .foregroundColor(Color.white)
              .frame(width: 150, height: 50)
              .background(Color.blue)
              .cornerRadius(15)
          }
      }
      .padding()
      Spacer()
    }
    
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
