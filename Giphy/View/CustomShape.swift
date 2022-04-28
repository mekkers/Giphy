//
//  CustomShape.swift
//  Giphy
//
//  Created by igor mekkers on 28.04.2022.
//

import SwiftUI

struct CustomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
