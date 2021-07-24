//
//  ViewControllerViewMode.swift
//  teste vitor
//
//  Created by Robson Novato Lobao on 02/07/21.
//

import Foundation

protocol SumDelegate {
    func showSum(sum: Float)
}

class ViewControllerViewModel {
    
    var delegate: SumDelegate?
    
    init(delegate: SumDelegate?) {
        self.delegate = delegate
    }
    
    func sum(number1: String, number2: String) {
        var sum: Float = 0
        if let n1 = Float(number1) {
            sum = n1
        }
        if let n2 = Float(number2) {
            sum += n2
        }
        delegate?.showSum(sum: sum)
    }
}
