//
//  RecentRowView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/06.
//

import SwiftUI

struct RecentRowView: View {
    var recent : profile
    var animation : Namespace.ID
    @EnvironmentObject var model : RecentRowVM
    var body: some View {
        HStack{
            
            Button(action: {
                
                model.showProfile.toggle()
                model.selectedProfile = recent
                
                
            }, label: {
                ZStack{
                    
                  
                        
                        Image(recent.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                           
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
              
                    
                    if !model.showProfile{
                    
                    
                    Image(recent.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: recent.id, in: animation)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        
                    }
                }
            })
            .buttonStyle(PlainButtonStyle())
            
             
            VStack{
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text(recent.username)
                            .fontWeight(.bold)
                        
                        
                        Text(recent.lastmsg)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        
                        
                    })
                    
                    Spacer()
                    
                    
                    Text(recent.time)
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
}

struct RecentRowView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
