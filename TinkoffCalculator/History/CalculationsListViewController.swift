//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by Максим Герасимов on 05.08.2024.
//


import UIKit

final class CalculationsListViewController: UIViewController {
    
    // MARK: - Constants
    
    private let cellIdentifier = "HistoryTableViewCell"
    
    // MARK: - Properties
    
    var calculations: [(expression: [CalculationHistoryItem], result: Double)] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Private Methods
    
    private func initialize() {
        modalPresentationStyle = .fullScreen
    }
    
    private func expressionToString(_ expression: [CalculationHistoryItem]) -> String {
        var result = ""
        
        for operand in expression {
            switch operand {
            case let .number(value):
                result += String(value) + " "
                
            case let .operation(value):
                result += value.rawValue + " "
            }
        }
        return result
    }
}

// MARK: - UITableViewDelegate

extension CalculationsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: Date())
        
        let label = UILabel()
        label.text = currentDate
        label.textColor = UIColor.white
        
        headerView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16.0).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
}

// MARK: - UITableViewDataSource

extension CalculationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HistoryTableViewCell
        let historyItem = calculations[indexPath.row]
        cell.configure(with: expressionToString(historyItem.expression), result: String(historyItem.result))
        return cell
    }
}
