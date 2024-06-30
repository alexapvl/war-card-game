//
//  ContentView.swift
//  War-Card-Game
//
//  Created by Alexandru Apavaloaiei on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    // property wrapper -> powers the visual state of the app
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 7.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    .foregroundColor(.white)
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 7.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize the players card
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the cpus card
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update the scores
        if playerCardValue > cpuCardValue {
            // Add 1 to player score
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            // Add 1 to cpu score
            cpuScore += 1
        }
        
    }
}

#Preview {
    ContentView()
}
