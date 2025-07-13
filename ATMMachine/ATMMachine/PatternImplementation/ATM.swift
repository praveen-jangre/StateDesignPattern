//
//  ATM.swift
//  ATMMachine
//
//  Created by Praveen Jangre on 12/07/2025.
//

import Foundation



fileprivate protocol ATMState {
    func insertCard()
    func enter(pin: String)
    func withdraw(amount: Float) -> Bool
    func transactionCompleted(success: Bool)
}

extension ATMState {
    func insertCard() {
        print("\(#function) not implemented for \(self) state")
    }
    
    func enter(pin: String) {
        print("\(#function) not implemented for \(self) state")
    }
    
    func withdraw(amount: Float) -> Bool {
        print("\(#function) not implemented for \(self) state")
        return false
    }
    
    func transactionCompleted(success: Bool) {
        print("\(#function) not implemented for \(self) state")
        
    }
}

fileprivate class NoCardState: ATMState {
    private let atm: ATM
    
    init(atm: ATM) {
        self.atm = atm
    }
    
    func insertCard() {
        print("Card inserted. Please enter your PIN.")
        atm.setState(atm.hasCardState)
    }
}

fileprivate class HasCardState: ATMState {
    private let atm: ATM
    
    init(atm: ATM) {
        self.atm = atm
    }
    
    func enter(pin: String) {
        if pin == "1234" {
            print("PIN OK")
            atm.setState(atm.pinValidatedState)
        } else {
            print("INVALID PIN. Transaction failed... don't forget your card.")
            atm.setState(atm.noCardState)
        }
    }
}


fileprivate class PinValidState: ATMState {
    private let atm: ATM
    
    init(atm: ATM) {
        self.atm = atm
    }
    
    func withdraw(amount: Float) -> Bool {
        guard amount > 0  else {
            print("Error! Enter a valid amount.")
            return false
        }
        if atm.availableFunds >= amount {
            atm.availableFunds -= amount
            print("> Withdraw $\(amount)")
            transactionCompleted(success: true)
            return true
        } else {
            print("Insufficient funds!")
            transactionCompleted(success: false)
            return false
        }
    }
    
    func transactionCompleted(success: Bool) {
        print("Transaction \(success ? "Complete" : "Failed")... don't forget your card.")
        atm.setState(atm.noCardState)
    }
}





public final class ATM {
    
    fileprivate var noCardState: ATMState!
    fileprivate var hasCardState: ATMState!
    fileprivate var pinValidatedState: ATMState!
    fileprivate var currentState: ATMState?
    
    fileprivate var availableFunds: Float = 10000
    
    
    fileprivate func setState(_ state: ATMState) {
        self.currentState = state
    }
    
    public init() {
        self.noCardState = NoCardState(atm: self)
        self.hasCardState = HasCardState(atm: self)
        self.pinValidatedState = PinValidState(atm: self)
        
        self.currentState = noCardState
    }
    
    public func insertCard() {
        currentState?.insertCard()
    }
    
    public func enter(pin: String) {
        currentState?.enter(pin: pin)
    }
    
    public func withdraw(amount: Float) -> Bool {
        currentState?.withdraw(amount: amount) ?? false
    }
    
    public func transactionCompleted(success: Bool) {
        currentState?.transactionCompleted(success: success)
    }
    
}


func startATMMachine() {
    let atm = ATM()
    atm.insertCard()
    atm.enter(pin: "1234")
    atm.withdraw(amount: 5000)
    
}
