//
//  LandingPage.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct LandingPage: View {
    @Binding var selectedCategry : categorie
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "rectangle.grid.2x2.fill")
                        .font(.title2)
                        .padding(10)
                        .background(Color.pink.opacity(0.12))
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                })
               
            }
            .overlay(
            
                HStack{
                    Image("placeholder")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                       
                    
                   
                    
                    Text("California US")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding(.trailing,30)
                        
                }
                .foregroundColor(.primary)
                
                
                
            
            )
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing:15){
                    
                    
                    HStack(spacing:15){
                        
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            
                            
                            (
                            
                                Text("The Fastest In Delevery ")
                                +
                                Text("Food")
                            
                            )
                            .font(.title)
                            .fontWeight(.bold)
                            
                        })
                        
                        
                        Spacer()
                        
                        
                        Image("delivery-man")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width / 2)
                        
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing:15){
                            
                            
                            ForEach(categories){category in
                                
                                
                                HStack(spacing:10){
                                    
                                    Image(category.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(selectedCategry.id == category.id ? Color.white : Color.gray)
                                        .frame(width: 20, height: 20)
                                    
                                    Text(category.name)
                                        .foregroundColor(selectedCategry.id == category.id ? Color.white : Color.black)
                                    
                                    
                                }
                                .padding(.vertical,12)
                                .padding(.horizontal)
                                .background(selectedCategry.id == category.id ? Color.pink : Color.gray)
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        
                                        
                                        selectedCategry = category
                                    }
                                }
                                .cornerRadius(10)
                            
                                
                            }
                            
                        }
                        .padding(.horizontal)
                    })
                    
                    
                    HStack{
                        
                        
                        Text("Popular Now")
                            .font(.custom("Quicksand_Bold_Oblique", size: 20))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View All")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .padding(.vertical,4)
                                .padding(.horizontal)
                                .background(Color.primary)
                                .cornerRadius(5)
                        })
                        
                    }
                    .padding()
                    .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        
                        
                        HStack(spacing:25){
                            
                            
                            ForEach(populars){popular in
                                
                                
                                PopularRowView(popular: popular)
                                
                            }
                            
                            
                            
                            
                        }
                        .padding()
                        
                    })
                    
                }
                
                
               
            })
            
            
        }
        .background(Color.red.opacity(0.1).ignoresSafeArea())
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
