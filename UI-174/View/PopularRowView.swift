//
//  PopularRowView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct PopularRowView: View {
    var popular : Popular
    var body: some View {
        VStack(spacing:15){
            
            
                Image(systemName: "flame")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(8)
                    .background(Color.purple.opacity(0.1).clipShape(Circle()))
                    .frame(maxWidth: .infinity,alignment: .trailing)
          
            
            
            Image(popular.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3)
                .padding(.top,6)
            
            Text(popular.title)
                .font(.custom("big_noodle_titling_oblique.ttf", size: 10))
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            
            Text(popular.description)
               
                .font(.body)
               
                .foregroundColor(.red)
            
            
            (
            
                Text(popular.price)
                
                +
                Text("円")
            
            )
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.purple)
            
            
        }
        .padding(.horizontal,30)
        .padding(.vertical,20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
    }
}

struct PopularRowView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
