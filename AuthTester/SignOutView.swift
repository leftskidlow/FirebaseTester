//
//  SignOutView.swift
//  SignOutView
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI

struct SignOutView: View {
  @EnvironmentObject var signInViewModel: SignInViewModel
  var body: some View {
    VStack {
      Text("You are signed in")
      Button {
        signInViewModel.signOut()
      } label: {
        Text("Sign Out")
          .foregroundColor(Color.white)
          .frame(width: 150, height: 50)
          .background(Color.blue)
          .cornerRadius(15)
      }
    }
    .tabItem {
      Label("Settings", systemImage: "list.dash")
    }
  }
}


struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
