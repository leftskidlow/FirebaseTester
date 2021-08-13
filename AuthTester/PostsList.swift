//
//  ContentView.swift
//  FirebaseTestProject
//
//  Created by Ben Stone on 8/9/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct PostsList: View {
    @StateObject var postData = PostData()
    
    var body: some View {
        NavigationView {
            List(postData.posts, id: \.text) { post in
              PostRow(post: post, postData: postData)
            }
            .refreshable {
              await postData.loadPosts()
            }
            .navigationTitle("Posts")
            .onAppear {
                Task {
                    await postData.loadPosts()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct PostListsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
