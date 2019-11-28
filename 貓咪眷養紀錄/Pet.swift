//
//  Pet.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/28.
//  Copyright © 2019 00657018. All rights reserved.
//

import Foundation

struct Pet: Identifiable, Codable {
    var id = UUID()
    var Mark: Bool
    var name: String
    var Variety: String
    var Gender: Bool
    var weight: Int
}
