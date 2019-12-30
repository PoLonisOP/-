//
//  PieChart.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/12/2.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct PieChart: Shape
{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path
    {
        Path
        {
            (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
