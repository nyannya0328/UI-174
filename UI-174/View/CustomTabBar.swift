//
//  CustomTabBar.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct CustomTabBar: View {
    @Namespace var animation
    @Binding var slectedTab : String
    var body: some View {
        HStack(spacing:0){
            
            TabButton(image: "house.fill", slectedtab: $slectedTab, animation: animation)
            
            TabButton(image: "gear", slectedtab: $slectedTab, animation: animation)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("search")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .padding(20)
                    .foregroundColor(.primary)
                    .background(Color.purple)
                    .clipShape(Circle())
            })
            .offset(y:-15)
            
            
            TabButton(image: "folder.fill.badge.gear", slectedtab: $slectedTab, animation: animation)
            
            TabButton(image: "sparkle", slectedtab: $slectedTab, animation: animation)
            
        }
        .padding(.top,10)
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(Color.white)
       
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct TabButton : View {
    
    var image : String
    @Binding var slectedtab : String
    var animation : Namespace.ID
    
    
    var body: some View{
        
        Button(action: {
            withAnimation(.spring()){
                
                
                slectedtab = image
            }
            
        }, label: {
            VStack{
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(slectedtab == image ? Color.pink : Color.primary)
                    .frame(width: 28, height: 28)
                
                
                if slectedtab == image{
                    
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 10, height: 10)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                
                    
                    
                }
                
                
            }
            .frame(maxWidth: .infinity)
        })
        
    }
}
