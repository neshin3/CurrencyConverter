//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Nestor on 11/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var USDAmount: UITextField!
    @IBOutlet weak var EuroS: UISwitch!
    @IBOutlet weak var PoundS: UISwitch!
    @IBOutlet weak var YenS: UISwitch!
    @IBOutlet weak var PesoS: UISwitch!
    @IBOutlet weak var Convert: UIButton!
    
    // Instantiate the model
    let converterLogic = ConverterLogic()
    var conversionResults: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usdText = USDAmount.text, let usdAmount = Double(usdText) else {
            print("Please enter a valid USD amount.")
            return
        }
        
        // Prepares conversion results
        if EuroS.isOn {
            if let euros = converterLogic.convert(usdAmount: usdAmount, to: "Euro") {
                conversionResults["Euro"] = "€\(String(format: "%.2f", euros))"
            }
        }
        if PoundS.isOn {
            if let pounds = converterLogic.convert(usdAmount: usdAmount, to: "Pound") {
                conversionResults["Pound"] = "£\(String(format: "%.2f", pounds))"
            }
        }
        if YenS.isOn {
            if let yen = converterLogic.convert(usdAmount: usdAmount, to: "Yen") {
                conversionResults["Yen"] = "¥\(String(format: "%.2f", yen))"
            }
        }
        if PesoS.isOn {
            if let pesos = converterLogic.convert(usdAmount: usdAmount, to: "Peso") {
                conversionResults["Peso"] = "₱\(String(format: "%.2f", pesos))"
            }
        }
        
        // Performs segue to the result view
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let destinationVC = segue.destination as? CurrencyConverterView {
                destinationVC.conversionResults = conversionResults
            }
        }
    }
}
