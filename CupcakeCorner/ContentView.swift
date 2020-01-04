//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jules Lee on 1/4/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.preferences.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.preferences.specialRequestEnabled {
                        Toggle(isOn: $order.preferences.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.preferences.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Detials")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
