//
//  SignInViewModel.swift
//  SignInViewModel
//
//  Created by Tim Miller on 8/12/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

class SignInViewModel: ObservableObject {
  
  let auth = Auth.auth()
  
  @Published var signedIn = false
  
  var isSignedIn: Bool {
    return auth.currentUser != nil
  }
  
  func getUser() -> String {
    guard let user = auth.currentUser?.email else {
      return "No User"
    }
    return user
  }
  
  func signIn(email: String, password: String) {
    auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in
      guard result != nil, error == nil else {
        return
      }
      
      DispatchQueue.main.async {
        // Success
        self?.signedIn = true
      }
     
    }
  }
  
  func signOut() {
    do {
      try auth.signOut()
      DispatchQueue.main.async {
        // Success
        self.signedIn = false
      }
    } catch {
      print(error)
    }
  }
  func signUp(email: String, password: String) {
    auth.createUser(withEmail: email, password: password) { [weak self] (result, error) in
      guard result != nil, error == nil else {
        return
      }
      DispatchQueue.main.async {
        // Success
        self?.signedIn = true
      }
    }
  }
}
