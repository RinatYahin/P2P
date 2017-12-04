//
//  PaymentToolTableViewCell.swift
//  P2P_iOS
//
//  Created by Vitaliy Kuzmenko on 26/07/2017.
//  Copyright © 2017 Wallet One. All rights reserved.
//

import UIKit
import P2PCore

extension String {
    
    public var maskEnd: String {
        if self.count <= 4 {
            return self
        }
        var last4digits = String(self.suffix(4))
        last4digits = last4digits.replacingOccurrences(of: "*", with: "•")
        return String(format: "•••• %@", last4digits)
    }
    
}

class PaymentToolTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    
    @IBOutlet weak var typeNameLabel: UILabel!
    
    @IBOutlet weak var maskedLabel: UILabel!
    
    weak var paymentTool: PaymentTool! {
        didSet {
            displayPaymentTool()
        }
    }
    
    func displayPaymentTool() {
        let v = CreditPaymentToolValidator()
        
        if let type = v.type(from: paymentTool.mask) {
            typeNameLabel.text = type.name
            typeImageView.image = UIImage(named: type.name + "Mini", in: .init(for: classForCoder), compatibleWith: nil)
        } else {
            typeNameLabel.text = P2PUILocalizedStrings("Unknown PaymentTool Type", comment: "")
            typeImageView.image = nil
        }
        
        maskedLabel.text = paymentTool.mask.maskEnd
    }
    
}