//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Leo  on 22.11.23.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true // Toggle is on by default
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Press Count: \(pressCount)")
            
            Button("Press Me") {
                pressCount += 1
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Entered name: \(name)")
            
            Spacer()
            
            Toggle("Toggle is \(toggleIsOn ? "on" : "off")", isOn: $toggleIsOn)
            
            Spacer()
            
            Rectangle()
                .fill(selectedColor) // no $, because its just reading
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 15))
            
            ColorPicker("Pick a rectangle color", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Your number: \(pressCount)", value: $pressCount, in: 0...10)
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
