//
//  HistoryTableViewCell.swift
//  TinkoffCalculator
//
//  Created by Максим Герасимов on 05.08.2024.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var expressionLabel: UILabel!
       @IBOutlet private weak var resultLabel: UILabel!
       
       func configure(with expression: String, result: String) {
           expressionLabel.text = expression
           resultLabel.text = result
       }
}
