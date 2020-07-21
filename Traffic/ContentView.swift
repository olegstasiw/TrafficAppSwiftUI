//
//  ContentView.swift
//  Traffic
//
//  Created by mac on 21.07.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonName = "START"
    @State private var lightIsOn = 1.0
    @State private var lightIsOff = 0.3
    @State private var currentLight = CurrentLight.red

    @State private var redColorOpacity = 0.3
    @State private var yellowColorOpacity = 0.3
    @State private var greenColorOpacity = 0.3


    var body: some View {

        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    ColorCircle(color: .red)
                    .opacity(redColorOpacity)
                    ColorCircle(color: .yellow)
                    .opacity(yellowColorOpacity)
                    ColorCircle(color: .green)
                    .opacity(greenColorOpacity)
                }

                Spacer()

                Button(action: {
                    self.buttonName = "NEXT"

                    switch self.currentLight {
                    case .red:
                        self.greenColorOpacity = self.lightIsOff
                        self.redColorOpacity = self.lightIsOn
                        self.currentLight = .yellow
                    case .yellow:
                        self.redColorOpacity = self.lightIsOff
                        self.yellowColorOpacity = self.lightIsOn
                        self.currentLight = .green
                    case .green:
                        self.greenColorOpacity = self.lightIsOn
                        self.yellowColorOpacity = self.lightIsOff
                        self.currentLight = .red
                    }

                }) {
                    Text(buttonName)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 35.0)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4))
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
