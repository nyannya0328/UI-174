//
//  category.swift
//  UI-174
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct categorie: Identifiable {
    var id = UUID().uuidString
    var name : String
    var image : String
    
}

var categories = [

    categorie(name: "さんどいっち", image: "sandwich"),
    categorie(name: "ぴざ", image: "pizza"),
    categorie(name: "けーき", image: "cupcake"),
    categorie(name: "ばーがー", image: "hamburger")
]
