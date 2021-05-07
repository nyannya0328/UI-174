//
//  ScrollUpView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct ScrollUpView: View {
    @State var scrollviewoffset : CGFloat = 0
    @State var startoffset : CGFloat = 0
    @State var isScrolloffset = false
    var body: some View {
        ScrollViewReader {scrollReader in
            ScrollView{
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    ForEach(1...100,id:\.self){_ in
                        
                        HStack(spacing:15){
                            
                            Circle()
                                .fill(Color.red.opacity(0.3))
                                .frame(width: 60, height: 60)
                            
                            VStack{
                                
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(height:10)
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.purple.opacity(0.3))
                                    .frame(height:10)
                                    .padding(.trailing,100)
                            }
                            
                        }
                        
                        
                    }
                    
                })
                .padding()
                .id("SCROLL_TO_TOP")
                .overlay(
                
                
                    GeometryReader{proxy -> Color in
                        
                        
                        if startoffset == 0{
                            
                            
                            self.startoffset = proxy.frame(in: .global).minY
                            
                        }
                        
                        let offset = proxy.frame(in: .global).minY
                        
                        self.scrollviewoffset = offset - startoffset
                    
                        return Color.clear
                        
                        
                    }
                
                )
                
            }
            .overlay(
                Button(action: {
                    
                    
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6)){
                   
                        isScrolloffset = true
                        
                        scrollReader.scrollTo("SCROLL_TO_TOP",anchor: .top)
                        
                    }
                        
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                    isScrolloffset = false
                        
                    }
                    
                }, label: {
                    Image(systemName: "arrow.up")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color.red)
                        .clipShape(Circle())
                })
                
                .padding(.leading,5)
                .padding(.bottom,getSafeArea().bottom == 0 ? 12 : 0)
                .opacity(-scrollviewoffset > 450 ? 1 : 0)
                .animation(.easeInOut)
                .disabled(isScrolloffset)
                
                
                ,alignment: .bottomLeading
        
        )
        }
    }
}

struct ScrollUpView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollUpView()
    }
}
