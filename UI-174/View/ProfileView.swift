//
//  ProfileView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/06.
//

import SwiftUI

struct ProfileView: View {
    var animation : Namespace.ID
    
    @EnvironmentObject var model : RecentRowVM
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack{
                
                Text("Whats up")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    .padding(.top)
                
                
                ForEach(recents){recent in
                    
                    RecentRowView(recent: recent, animation: animation)
                    
                    
                    
                }
                
                
            }
        })
        .overlay(
            ZStack(alignment:.top){
                if model.showProfile{
                    
                    
                    ProfileDateView(animation: animation)
                       
                    
                    
                    
                }
                
                
            }
        
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
