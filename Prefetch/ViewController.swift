//
//  ViewController.swift
//  fruits
//
//  Created by Mobicip on 24/04/26.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    let fruits = [
        "Apple","Banana","Orange","Mango","Grapes",
        "Pineapple","Strawberry","Watermelon","Papaya","Guava",
        "Kiwi","Peach","Cherry","Pomegranate","Pear",
        "Litchi","Dragon Fruit","Blueberry","Raspberry","Coconut"
    ]
    
    let prices = [
        120, 40, 80, 150, 90,
        60, 200, 30, 50, 70,
        180, 140, 220, 160, 110,
        130, 250, 300, 280, 60
    ]
    
    let imageURLs: [URL] = (1...20).map {
        URL(string: "https://picsum.photos/id/\($0 + 10)/200")!
    }
    
    var imageCache: [Int: UIImage] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(FruitCell.self, forCellReuseIdentifier: "FruitCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        
        tableView.rowHeight = view.frame.height/5
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Image Fetch
    func fetchImage(for index: Int) async {
        if imageCache[index] != nil { return }
        
        let url = imageURLs[index]
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                imageCache[index] = image
            }
        } catch {
            print("Error:", error)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        
        cell.nameLabel.text = fruits[indexPath.row]
        cell.priceLabel.text = "₹\(prices[indexPath.row])/kg"
        
        if let image = imageCache[indexPath.row] {
            cell.fruitImage.image = image
        } else {
            cell.fruitImage.image = nil
            
            Task { [weak self] in
                guard let self = self else { return }
                
                await self.fetchImage(for: indexPath.row)
                
                DispatchQueue.main.async {
                    if let updatedCell = tableView.cellForRow(at: indexPath) as? FruitCell {
                        updatedCell.fruitImage.image = self.imageCache[indexPath.row]
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return "Fruits"
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView,
                   prefetchRowsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            Task { [weak self] in
                await self?.fetchImage(for: indexPath.row)
            }
        }
    }
}
