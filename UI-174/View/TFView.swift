//
//  TFView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct TFView: View {
    @StateObject var model = TFManaeger()
    @State var isTapped = false
    var body: some View {
        VStack{
            
            VStack(alignment: .leading, spacing: 15, content: {
              
                TextField("", text: $model.txt) { statas in
                    
                    if statas{
                        
                        withAnimation(.easeIn){
                            
                             isTapped = true
                            
                            
                        }
                    }
                    
                } onCommit: {
                    
                    if model.txt == ""{
                      
                            
                            withAnimation(.easeOut){
                                
                                 isTapped = false
                                
                                
                            }
                        
                    }
                    
                    
                }
                .padding(isTapped ? 15 : 0)
                .background(
                
                
                Text("USER NAME")
                    .scaleEffect(isTapped ? 0.8 : 1)
                    .offset(x: isTapped ? -7 : 0, y: isTapped ? -15 : 0)
                    .foregroundColor(isTapped ? .accentColor : .gray)
                    
                    
                    
                    ,alignment: .leading
                
                )
                .padding(.horizontal)
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray)
                    .opacity(isTapped ? 1 : 0)
                    .frame(height: 1)
                    .padding(.top,12)

                
            })
            .padding(.top,12)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)
            
            
            HStack{
                
                
                Spacer()
                
                Text("\(model.txt.count) / 15")
                  
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.trailing)
                    .padding(.top,5)
                    
            }
            
        }
        .padding()
    }
}

struct TFView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}


class TFManaeger : ObservableObject{
    
    
    @Published var txt = ""{
        
        didSet{
            
            if txt.count > 15 && oldValue.count <= 15{
                
            txt = oldValue
            }
            
        }
        
        
    }
}
