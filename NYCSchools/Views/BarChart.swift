//
//  BarChart.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/27/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import Foundation
import UIKit

struct BarEntry{
    
    let reading: String
    let writing: String
    let math: String
    let score: Int
}

class BarChart: UIView{
    private let minLayer : CALayer = CALayer()
    private let scrollView: UIScrollView = UIScrollView()
    
    let space: CGFloat = 40.0
    let barHeight: CGFloat = 40.0
    let contentSpace : CGFloat = 88.0

    
}
