//
//  SignOutView.swift
//  SignOutView
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI

struct SignOutView: View {
  
//  @State var userName: String = ""
  var userName = "exampleUser10101"
  @EnvironmentObject var signInViewModel: SignInViewModel
  
  var body: some View {
    VStack{
      Image(systemName: "person.circle")
        .resizable()
        .scaledToFit()
        .padding()
      Button {
        
      } label: {
        Text("Change Photo...")
      }
      Spacer()
      Text("User Name:")
      Text(userName)
        .font(.title2)
        .bold()
      Spacer()
      Button {
        signInViewModel.signOut()
      } label: {
        Text("Sign Out")
          .foregroundColor(Color.white)
          .frame(width: 150, height: 50)
          .background(Color.blue)
          .cornerRadius(15)
      }
      Spacer()
    }
//    .tabItem {
//      Label("Settings", systemImage: "list.dash")
//    }
  }
}


struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
