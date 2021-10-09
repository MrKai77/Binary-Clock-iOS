//
//  Rows.swift
//  Binary Clock
//
//  Created by Kai Azim on 2021-10-08.
//
// 4 different functions to calculate wether the circle is on or off

import Foundation

func Row1(timeVal:String) -> Bool {     // ROW 1
    switch timeVal {
    case "0":
        return false
    case "1":
        return true
    case "2":
        return false
    case "3":
        return true
    case "4":
        return false
    case "5":
        return true
    case "6":
        return false
    case "7":
        return true
    case "8":
        return false
    case "9":
        return true
    default:
        return false
        
    }
}

func Row2(timeVal:String) -> Bool {     // ROW 2
    switch timeVal {
    case "0":
        return false
    case "1":
        return false
    case "2":
        return true
    case "3":
        return true
    case "4":
        return false
    case "5":
        return false
    case "6":
        return true
    case "7":
        return true
    case "8":
        return false
    case "9":
        return false
    default:
        return false
        
    }
}

func Row4(timeVal:String) -> Bool {     // ROW 3
    switch timeVal {
    case "0":
        return false
    case "1":
        return false
    case "2":
        return false
    case "3":
        return false
    case "4":
        return true
    case "5":
        return true
    case "6":
        return true
    case "7":
        return true
    case "8":
        return false
    case "9":
        return false
    default:
        return false
        
    }
}

func Row8(timeVal:String) -> Bool {     // ROW 4
    switch timeVal {
    case "0":
        return false
    case "1":
        return false
    case "2":
        return false
    case "3":
        return false
    case "4":
        return false
    case "5":
        return false
    case "6":
        return false
    case "7":
        return false
    case "8":
        return true
    case "9":
        return true
    default:
        return false
        
    }
}
