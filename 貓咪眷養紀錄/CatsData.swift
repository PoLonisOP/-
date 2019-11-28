//
//  CatsData.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/28.
//  Copyright © 2019 00657018. All rights reserved.
//

import Foundation

class CatsData: ObservableObject {
    
    @Published var pets = [Pet]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(pets) {
                UserDefaults.standard.set(data, forKey: "pets")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "pets") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Pet].self, from: data) {
                pets = decodedData
            }
        }
    }
    
}
