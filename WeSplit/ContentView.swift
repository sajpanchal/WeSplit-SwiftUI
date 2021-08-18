//
//  ContentView.swift
//  WeSplit
//
//  Created by saj panchal on 2021-05-24.
//

/*swiftUI framework*/
import SwiftUI
/* this struct conforms to View protocol which is part of SwiftUI.*/
struct ContentView: View {
    @State var checkAmount = ""
//    @State var numberOfPeople = 2
    @State var numberOfPeople = "2"
    @State var tipPercentage = 2
    let tipPercentages = [10,15,20,25,0]
    var individualShare: Double {
        let x = Double(checkAmount)
        let y = Double(numberOfPeople)
        let z = Double(tipPercentages[tipPercentage])
        let amount:Double = x ?? 0.0
        let tip: Double = amount * (z/100.0)
        var sum: Double = amount + tip
        sum = sum/(y ?? 1.0)
        return sum
    }
    /* computed property returning an object of type View. */
    var body: some View {
        
        //this adds a horizontal space on top
        NavigationView() {
            Form() {
                TextField("Enter Check Amount", text: $checkAmount).keyboardType(.decimalPad)
                Section(header:Text("Number of People")) {
                    //selection is a arg that defines the index of the range. here it is 2 so, it will select 2 from the range 0,1,2,... by default.
                   
                    /*Picker("Select number of people", selection: $numberOfPeople, content: {
                        ForEach(0..<100) {
                            Text("\($0)")
                        }
                    })*/
                    TextField("Enter number of People", text: $numberOfPeople).keyboardType(.decimalPad)
                }
                Section(header: Text("Select The Tip Amount:")) {
                    Picker("Enter the tip Amount", selection: $tipPercentage, content: {
                        ForEach(0..<5) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person:")) {
                    Text("Individual Share is: \(individualShare, specifier: "%.2f")")
                }
                Section(header: Text("Total amount to pay: ")) {
                    Text("\(individualShare*(Double(numberOfPeople) ?? 1.0), specifier: "%.2f")").foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
                }
            }.navigationBarTitle("WeSplit", displayMode: .inline) //this is the modifier that is linked in navigation view but it is declared inside the navigation view at the end of form. because navigation view are capable of showing many views as your program runs.
        }
    }
}
    
// it shos the preview of our contentView.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
