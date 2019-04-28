//
//  HomeViewController.swift
//  MilosDimicProducerConsumer
//
//  Created by Dimic Milos on 4/28/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK:  Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties

    private let serialQueue = DispatchQueue(label: "worker")
    
    private var dataSource: [UITableViewCell] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func produce() {
        let cell = UITableViewCell()
        cell.backgroundColor = .green
        
        serialQueue.async { [weak self] in
            self?.dataSource.insert(cell, at: 0)
        }
    }
    
    private func consume() {
        serialQueue.sync { [weak self] in
            guard let self = self, !self.dataSource.isEmpty else { return }
            _ = self.dataSource.removeLast()
        }
    }
    
    // MARK: - Action methods
    
    @IBAction func buttonCreateProducerTapped(_ sender: UIButton) {
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            self?.produce()
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @IBAction func buttonCreateConsumerTapped(_ sender: UIButton) {
        let timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { [weak self] _ in
            self?.consume()
        }
        RunLoop.main.add(timer, forMode: .common)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource[indexPath.row]
    }
}

