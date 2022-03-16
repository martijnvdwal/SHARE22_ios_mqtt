//
//  ViewController.swift
//  SHARE22_ios_mqtt
//
//  Created by martijn van der wal on 16/03/2022.
//

import UIKit
import CocoaMQTT

class OverviewViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private let reuseIdentifier = "OverviewTableViewCell"
    private var viewModels = [OverviewItemViewModel]() // create empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupTableView()
        loadSampleData()
        setupMQTT()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "OverviewTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadSampleData() {
        viewModels = [.example]
        tableView.reloadData()
    }
    
    private func setupMQTT() {
        // Hier moet jij gaan zweten ;)
    }
}

// MARK: - UITableViewDelegate
extension OverviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
}

// MARK: - UITableViewDataSource
extension OverviewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? OverviewTableViewCell else { return UITableViewCell() }
        cell.configure(viewModel: viewModels[indexPath.item])
        return cell
    }
}

