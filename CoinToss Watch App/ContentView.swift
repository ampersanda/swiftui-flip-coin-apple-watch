//
//  ContentView.swift
//  CoinToss Watch App
//
//  Created by Lucky Pradana on 09/11/22.
//

import SwiftUI

enum Coin : CaseIterable {
    case head, tail
}

struct ContentView: View {
    
    @State private var loading = false
    @State private var result : Coin? = nil
    
    var body: some View {
        VStack {
            Text(getLabel())
                .padding(.bottom, 24.0)
                .fontWeight(.bold)
            
            Button (action: flipCoin) {
                Text(result != nil ? "Reset" : "Flip")
            }.disabled(loading)
        }
        .padding()
    }
    
    func flipCoin () -> Void {
        if (result != nil){
            result = nil
        } else {
            loading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                result = Coin.allCases.randomElement()
                loading = false
            }
        }
    }
    
    func getLabel() -> String {
        if (loading){
            return "Flipping...";
        } else if (result == .head){
            return "You got Head!"
        } else if (result == .tail){
            return "You got Tail!"
        }
        
        return "Flip The Coin";
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
