//
//  NewPostView.swift
//  CRUD Operation
//
//  Created by PRO M1 2020 8/256 on 05/08/23.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var isPresented: Bool
    @Binding var title: String
    @Binding var post: String
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Create New Post")
                        .font(Font.system(size: 16, weight: .bold))
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    TextField("Write Something", text: $post)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    Spacer()
                    
                }.padding()
                    .alert(isPresented: $isAlert, content: {
                        let title = Text("No data")
                        let message = Text("Please fill your title and post!")
                        return Alert(title: title, message: message)
                    })
            }
            
            .navigationBarTitle("New Post", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancel").font(.footnote)
        })
    }
    
    var trailing: some View {
        Button(action: {
            if title != "" && post != "" {
                let parameters: [String: Any] = ["title": title, "post": post]
                viewModel.createPosts(parameters: parameters)
                viewModel.fetchPosts()
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Post").font(.footnote)
        })
    }
}

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
