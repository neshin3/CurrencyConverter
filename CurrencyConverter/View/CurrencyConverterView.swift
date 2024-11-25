//
//  CurrencyConverterView.swift
//  CurrencyConverter
//
//  Created by Nestor on 11/24/24.
//

import UIKit

class CurrencyConverterView: UIViewController {
    
    // Labels for conversion results
    @IBOutlet weak var EuroC: UILabel!
    @IBOutlet weak var PoundC: UILabel!
    @IBOutlet weak var YenC: UILabel!
    @IBOutlet weak var PesoC: UILabel!
    
    // Labels for currency names
    @IBOutlet weak var EuroCLabel: UILabel!
    @IBOutlet weak var PoundCLabel: UILabel!
    @IBOutlet weak var YenCLabel: UILabel!
    @IBOutlet weak var PesoCLabel: UILabel!
    
    var conversionResults: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Updates labels with conversion results or hide them if not available
        updateCurrency(EuroCLabel, valueLabel: EuroC, with: conversionResults["Euro"])
        updateCurrency(PoundCLabel, valueLabel: PoundC, with: conversionResults["Pound"])
        updateCurrency(YenCLabel, valueLabel: YenC, with: conversionResults["Yen"])
        updateCurrency(PesoCLabel, valueLabel: PesoC, with: conversionResults["Peso"])
    }
    
    // Helper function updates both the value label, or hide them
    private func updateCurrency(_ currencyLabel: UILabel, valueLabel: UILabel, with value: String?) {
        if let value = value, !value.isEmpty {
            currencyLabel.isHidden = false // Show the currency name label
            valueLabel.isHidden = false   // Show the value label
            valueLabel.text = value       // Update the value label text
        } else {
            currencyLabel.isHidden = true // Hide the currency name label
            valueLabel.isHidden = true   // Hide the value label
        }
    }
}
