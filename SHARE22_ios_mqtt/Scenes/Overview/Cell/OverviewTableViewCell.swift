//
//  OverviewTableViewCell.swift
//  SHARE22_ios_mqtt
//
//  Created by martijn van der wal on 16/03/2022.
//

import UIKit

struct OverviewItemViewModel {
    let color: UIColor
    let name: String
    let deviceName: String
    let date: String
    
    static let example = OverviewItemViewModel(
        color: .systemIndigo,
        name: "New item",
        deviceName: "iPhone 13 Pro",
        date: Date.now.formatted())
}

class OverviewTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet private weak var colorRectangeView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var deviceNameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func configure(viewModel: OverviewItemViewModel) {
        setupView()
        
        colorRectangeView.backgroundColor = viewModel.color
        nameLabel.textColor = viewModel.color
        
        nameLabel.text = viewModel.name
        deviceNameLabel.text = viewModel.deviceName
        dateLabel.text = viewModel.date
    }
    
    private func setupView() {
        colorRectangeView.layer.cornerRadius = 3
        colorRectangeView.clipsToBounds = true
    }
}
