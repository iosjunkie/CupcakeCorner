//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jules Lee on 1/4/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @State var order = Order()
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
