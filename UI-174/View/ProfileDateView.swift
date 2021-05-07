//
//  ProfileDateView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/06.
//

import SwiftUI

struct ProfileDateView: View {
    @EnvironmentObject var model : RecentRowVM
    var animation : Namespace.ID
    
    @GestureState var offset : CGFloat = 0
    var body: some View {
        ZStack(alignment:.top){
            
            if model.selectedProfile != nil{
                if model.showEnlargedImage{
                    
                    Image(model.selectedProfile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: model.selectedProfile.id, in: animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                      
                        .offset(y:model.offset)
                        .gesture(DragGesture().updating($offset, body: { value, out, _ in
                            out = value.translation.height
                        }).onEnded({ value in
                            
                            let offset = model.offset > 0 ? model.offset : -model.offset
                            
                            withAnimation{
                                
                                
                                if offset > 200{
                                    
                                    model.showProfile.toggle()
                                    model.showEnlargedImage.toggle()
                                    model.selectedProfile = nil
                                    
                                    
                                }
                                model.offset = 0
                            }
                            
                        }))
                        .background(Color.primary.opacity(getOpacity()).ignoresSafeArea())
                        
                    
                    
                    HStack{
                        
                        Button(action: {
                            
                            model.showEnlargedImage.toggle()
                            model.selectedProfile = nil
                            
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 30, weight: .semibold))
                                .foregroundColor(.orange)
                            
                            
                            Text(model.selectedProfile.username)
                                .font(.title2)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: "Text\(model.selectedProfile.id)", in: animation)
                            
                        })
                        
                        
                      Spacer()
                        
                    }
                    .padding(.top)
                    
                        
                    
                    
                }
                
                else{
                    
                    
                    
                    Button(action: {
                        
                        withAnimation(.easeInOut){
                            
                            model.showEnlargedImage.toggle()
                            
                            
                        }
                        
                    }, label: {
                        Image(model.selectedProfile.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(TitleView(recent: model.selectedProfile, animation: animation),alignment: .top)
                    })
                        .overlay(ButtonActions().offset(y: 55),alignment: .bottom)
                        .matchedGeometryEffect(id: model.selectedProfile.id, in: animation)
                        .frame(width: 300, height: 300)
                        //.frame(maxWidth: .infinity, maxHeight: .infinity)
                       
                     
                        .onTapGesture {
                            
                            withAnimation{
                                
                                
                                model.showProfile.toggle()
                                model.selectedProfile = nil
                                
                            }
                            
                        }
                }
                
                
                
                
                   
            }
        }
        .onChange(of: offset, perform: { value in
            model.offset = offset
        })
        
        
    }
    
    func getOpacity()->Double{
        
        let offset = model.offset > 0 ? model.offset : -model.offset
        
        let progress = offset / 200
        
        
        return 1 - Double(progress)
        
    }
}

struct ProfileDateView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct TitleView : View {
  
    var recent : profile
    var animation : Namespace.ID
    var body: some View{
        
        Text(recent.username)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .matchedGeometryEffect(id: "Text\(recent.id)", in: animation)
            .frame(maxWidth: .infinity,alignment: .leading)
            .lineLimit(1)
            .padding(.horizontal)
            .padding( .vertical,10)
            .background(Color.gray.opacity(0.2))
        
      
        
        
        
    }
}

struct ButtonActions : View {
    var body: some View{
        
        HStack{
            
            
          
                    
                    Image(systemName: "message.fill")
                      .font(.title2)
                      .foregroundColor(.gray)
                   
            
      
           
            
            
            Spacer()
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image(systemName: "info.circle.fill")
                .font(.title2)
                .foregroundColor(.gray)
            })
            
        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
        
    }
}
