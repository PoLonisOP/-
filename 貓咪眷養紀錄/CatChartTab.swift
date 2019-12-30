//
//  CatChartTab.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/12/2.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct CatChartTab: View {
    var body: some View {
        TabView {
            CatChart(catsData: CatsData())
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Weight")
            }
            CatChart2(catsData: CatsData())
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Variety")
            }
        }
    }
}

struct CatChartTab_Previews: PreviewProvider {
    static var previews: some View {
        CatChartTab()
    }
}
