//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by Максим Герасимов on 05.08.2024.
//

import UIKit

final class CalculationsListViewController: UIViewController {
    

    var result: String?
    @IBOutlet weak var calculationLabel: UILabel!

    // MARK: - View Life Cycles
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculationLabel.text = result

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
  
    // MARK: - Private Methods
    
    private func initialize() {
        modalPresentationStyle = .fullScreen
    }
    

}

