//
//  ContentView.swift
//  AmountSplitApp
//
//  Created by BSAL-MAC on 5/24/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = ""
    @State var noOfPeople = 2
    @State var tipPercentage = 2
    let tipPercentages = [10,15,20,25,0]
    var total = 0.0
    
    var totalPerPerson: Double{
        //calculate the total per person here
        let peopleCount = Double(noOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $noOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }//assigning by $
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentages", selection: $tipPercentage){
                    ForEach(0..<tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Split App", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
