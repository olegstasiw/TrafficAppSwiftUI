//
//  ColorCircle.swift
//  Traffic
//
//  Created by mac on 21.07.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import SwiftUI

struct ColorCircle: View {
let color: UIColor
    
    var body: some View {
        Color(color)
            .frame(width: 135, height: 135)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red)
    }
}
