//
//  LoginView.swift
//  LoginView
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
  
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
        HStack {
          Button {
            
            guard !email.isEmpty, !password.isEmpty else {
              return
            }
            signInViewModel.signIn(email: email, password: password)
            
          } label: {
            Text("Sign In")
              .foregroundColor(Color.white)
              .frame(width: 150, height: 50)
              .background(Color.blue)
              .cornerRadius(15)
          }
          NavigationLink("Create Account", destination: SignUpView())
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
