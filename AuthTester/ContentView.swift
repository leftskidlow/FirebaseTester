//
//  ContentView.swift
//  AuthTester
//
//  Created by Tim Miller on 8/12/21.
//

import SwiftUI


@available(iOS 15.0, *)
struct ContentView: View {
  
  @EnvironmentObject var signInViewModel: SignInViewModel

    var body: some View {
      NavigationView {
        if signInViewModel.signedIn {
          TabView{
            PostsList()
              .tabItem {
                Label("Posts", systemImage: "list.dash")
              }
            NewPostForm()
              .tabItem {
                Label("New Post", systemImage: "plus.circle")
              }
            SignOutView()
          }
        } else {
          SignInView()
        }
      }
      .onAppear {
        signInViewModel.signedIn = signInViewModel.isSignedIn
      }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(SignInViewModel())
    }
}



