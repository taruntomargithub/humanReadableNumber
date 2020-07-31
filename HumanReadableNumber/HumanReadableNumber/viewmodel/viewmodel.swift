//
//  viewmodel.swift
//  HumanReadableNumber
//
//  Created by Tarun Tomar on 31/07/20.
//  Copyright © 2020 Tarun Tomar. All rights reserved.
//

import Foundation


class HumanreadableViewModel {
    
    func getNumber(num: Int) -> String {
        var numberInWords = ""
        if num < 999999999 {
            numberInWords += numberToWords(num: (num / 10000000), val: "  CRORE")
            numberInWords += numberToWords(num: ((num / 100000) % 100), val: "  LAKH")
            numberInWords += numberToWords(num: ((num / 1000) % 100), val: "  THOUSAND")
            numberInWords += numberToWords(num: ((num / 100) % 10), val: "  HUNDRED")
            numberInWords += numberToWords(num: num % 100, val: " ")
        }
        return numberInWords
    }
    
    func numberToWords(num: Int, val: String) -> String {
        let ones:[String] = [" ", " ONE", " TWO", " THREE", " FOUR", " FIVE", " SIX", " SEVEN", " EIGHT", " NINE", " TEN", " ELEVEN", " TWELVE", " THIRTEEN", " FOURTEEN", " FIFTEEN", " SIXTEEN", " SEVENTEEN", " EIGHTEEN", " NINETEEN"]
        let tens:[String] = [" ", " ", " TWENTY", " THIRTY", " FOURTY", " FIFTY", " SIXTY", " SEVENTY", " EIGHTY", " NINETY"]
        var tempStr: String = ""
        if num > 19 {
            tempStr = tempStr + "\(tens[num / 10] + " " + ones[num % 10])"
            print(tens[num / 10] + " " + ones[num % 10], separator: " ", terminator: "")
        }else {
            tempStr = tempStr + "\(ones[num])"
            print(ones[num], separator: " ", terminator: "")
        }
        if num > 0 {
            tempStr = tempStr + "\(val)"
            print(val, separator: " ", terminator: "")
        }
        return tempStr
    }
}

