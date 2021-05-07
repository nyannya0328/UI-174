//
//  RecentRowVM.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/06.
//

import SwiftUI

class RecentRowVM: ObservableObject {
    @Published var showProfile = false
    @Published var selectedProfile : profile!
    
    @Published var offset : CGFloat = 0
    @Published var showEnlargedImage = false
    
}

