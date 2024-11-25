//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by Nestor on 11/24/24.
//


import Foundation

struct ConverterLogic {
    
    let exchangeRates: [String: Double] = [
        "Euro": 0.95,
        "Pound": 0.79,
        "Yen": 154.21,
        "Peso": 20.38
    ]
    
    func convert(usdAmount: Double, to currency: String) -> Double? {
        guard let rate = exchangeRates[currency] else { return nil }
        return usdAmount * rate
    }
}
