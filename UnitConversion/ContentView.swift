//
//  ContentView.swift
//  UnitConversion
//
//  Created by DJ on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    let options = ["Feet", "Meters", "Yards", "Kilometers", "Miles"]
    @State private var output = "Feet"
    var newLength : Double {
        if output == "Yards" {
            return input / 3
        } else if output == "Meters" {
            return input / 3.281
        } else if output == "Kilometers" {
            return input / 3281
        } else if output == "Miles" {
            return input / 5280
        }
        return input
    }
    
    
    var body: some View {
        NavigationView {
            Form {
            Section {
                TextField("Length Please: ", value: $input, format: .number)
                    .keyboardType(.decimalPad)
            } header: {
            Text("How many feet")
            }
            Section {
                Picker("Type", selection: $output) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                }
            Section {
                Text(newLength, format: .number)
            } footer: {
                Text(output )
            }
            }
                }
            }
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
