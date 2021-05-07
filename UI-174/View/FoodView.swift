//
//  FoodView.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct FoodView: View {
    @State var selectedCategry : categorie = categories.first!
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var selectedTab = "house.fill"
    
    @Namespace var animation
    @StateObject var model = RecentRowVM()
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection:$selectedTab){
                
                LandingPage(selectedCategry: $selectedCategry)
                    .tag("house.fill")
                
               TFView()
                    .tag("gear")
                
                
                ScrollUpView()
                    .tag("folder.fill.badge.gear")
                
                ProfileView(animation: animation)
                   .environmentObject(model)
                    .tag("sparkle")
                
                    
            }
            CustomTabBar(slectedTab: $selectedTab)
                
        }
        
       
        //.ignoresSafeArea()
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}


extension View{
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
