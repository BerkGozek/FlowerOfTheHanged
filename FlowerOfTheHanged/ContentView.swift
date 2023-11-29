//
//  ContentView.swift
//  FlowerOfTheHanged
//
//  Created by Berk Gozek on 29/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var onScreen = "-----";
    @State var answer = "-----";
    @State var ansList = ["sedat","allah","cryin","swift","death","pluto","hades","shiva"];
    @State var ansReadOnly = "-----";
    
    @State var wordsGuessed = 0;
    @State var wordsLeft : Int = 0;
    
    @State var livesUsed    =   0   ;
    @State var livesLeft    =   6   ;
    
    @State var ans          =   ""  ;
    
    
    
    var body: some View {
        VStack{
            HStack{
                
                Text("Words Left:")
                    .padding(.leading)
                Text(String(wordsLeft))
                Spacer()
                Text("Words Found:")
                Text(String(wordsGuessed))
                    .padding(.trailing)
                
            }
            HStack{
                
                Text("Lives Left:")
                    .padding(.leading)
                Text(String(livesLeft))
                Spacer()
                Text("Lives Spent:")
                
                Text(String(livesUsed))
                    .padding(.trailing)
                
            }
            .padding(.trailing)
            Rectangle()
                .frame(width: 200, height: 300, alignment: .center)
            HStack{
                TextField("", text: $ans)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 30.0, height: 50.0)
                
                Text(onScreen)
                    .font(.title)
            }
            Button("Submit Letter"){
                isInWord(skibidi: ans)
                if (foundItYet()){
                    newWord()
                }
            }.buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
            Spacer()
            
        }
        .onAppear(){
            newWord()
            wordsLeft = ansList.count
        }
        
    }
    
    func newWord(){
        onScreen  = "-----";
        answer = ansList.randomElement() ?? "hello"
        ansReadOnly = answer
        
    }
    
    func isInWord(skibidi: String) {
        var bet = skibidi.lowercased()
        if (bet != "") {
            if answer.contains(bet) {
                var onScreenArray = Array(onScreen)
                var answerArray = Array(answer)
                
                for (index, char) in answer.enumerated() {
                    if String(char) == bet {
                        onScreenArray[index] = bet.first!
                        answerArray[index] = "-"
                    }
                    
                }
                
                
                onScreen = String(onScreenArray)
                answer = String(answerArray)
            }
            else{
                livesUsed = livesUsed+1;
                livesLeft = livesLeft-1;
            }
        }
        ans = ""
        
    }
    
    func foundItYet()->Bool{
        if(ansReadOnly == onScreen){
            wordsGuessed = wordsGuessed + 1
            return true
        }
        else
        {
            return false
        }
    }
}

#Preview {
    ContentView()
}
