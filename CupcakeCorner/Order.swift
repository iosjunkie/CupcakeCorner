//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jules Lee on 1/4/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//

import Foundation

struct Order: Codable {
    var type = 0
    var quantity = 0
    var preferences: Preferences = .default
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    struct Preferences: Codable {
        var specialRequestEnabled: Bool
        var extraFrosting: Bool
        var addSprinkles: Bool
        
        
        static var `default` = Preferences(
            specialRequestEnabled: false,
            extraFrosting: false,
            addSprinkles: false
        )
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if self.preferences.extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if self.preferences.addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty || (name + streetAddress + city + zip).isReallyEmpty {
            return false
        }

        return true
    }
}

//class Order: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
//    }
//
//    init() {
//
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
//
//    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
//
//    @Published var type = 0
//    @Published var quantity = 3
//    @Published var specialRequestEnabled = false {
//        didSet {
//            if specialRequestEnabled == false {
//               extraFrosting = false
//                addSprinkles = false
//            }
//        }
//    }
//    @Published var extraFrosting = false
//    @Published var addSprinkles = false
//
//    @Published var name = ""
//    @Published var streetAddress = ""
//    @Published var city = ""
//    @Published var zip = ""
//
//    var hasValidAddress: Bool {
//        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty || (name + streetAddress + city + zip).isReallyEmpty {
//            return false
//        }
//
//        return true
//    }
//
//    var cost: Double {
//        // $2 per cake
//        var cost = Double(quantity) * 2
//
//        // complicated cakes cost more
//        cost += (Double(type) / 2)
//
//        // $1/cake for extra frosting
//        if extraFrosting {
//            cost += Double(quantity)
//        }
//
//        // $0.50/cake for sprinkles
//        if addSprinkles {
//            cost += Double(quantity) / 2
//        }
//
//        return cost
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
//    }
//}
//
extension String {
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
