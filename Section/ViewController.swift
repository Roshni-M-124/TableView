//
//  ViewController.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    // Frame doesnt matter in autolayout. 2 other style : .grouped space between each section, .insetGrouped rounded edges for content view.
    
    let profileData = [
    """
    John Christopher Anderson The Third,
    Senior Developer with 10+ years of experience in building applications.
    """
    ]

    let infoData: [(key: String, value: String)] = [
        ("Phone", "+91 94228 98765 (Available between 9 AM - 6 PM IST for work-related queries and collaborations)"),
        ("Email", "john.longemailaddress@exampledomain.com (Feel free to reach out for freelance or full-time opportunities)"),
        ("Address", "221B Baker Street, Near Central Park Extension Area, New York City, United States of America")
    ]
    let friendsData = [
    """
    Alice Johnson - UI/UX Designer who loves creating intuitive user experiences and has worked on multiple award-winning apps.
    """,
    """
    Bob Smith - Backend Engineer specializing in distributed systems, APIs, and cloud infrastructure with 8 years of experience.
    """
    ]
    
    enum SectionType: Int,CaseIterable{
        case profile
        case info
        case friends
    }
    
    var imageCache: [Int: UIImage] = [:]

    let friendImageURLs: [URL] = [
        URL(string: "https://www.shutterstock.com/image-illustration/anime-boys-sketch-no-color-260nw-2279782005.jpg")!,
        URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzo2M3X6wyegKjJpz8OvB9NaICEVHDiDXQ9g&s")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")//ProfileCell is type name, ProfileCell.self is type object and ProfileCell() is instance we give the type of class to create instance of this class later .
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func fetchImage(for index: Int) async {
        if imageCache[index] != nil { return }
        
        let url = friendImageURLs[index]
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let image = UIImage(data: data) {
                imageCache[index] = image
            }
        } catch {
            print("Error fetching image:", error)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }

        switch sectionType {
        case .profile:
            return profileData.count
        case .info:
            return infoData.count
        case .friends:
            return friendsData.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let sectionType = SectionType(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sectionType {
            
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.nameLabel.text = profileData[indexPath.row]
            return cell
            
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            let item = infoData[indexPath.row]
            cell.titleLabel.text = item.key
            cell.infoLabel.text = item.value
            return cell
            
        case .friends:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
            cell.friendLabel.text = friendsData[indexPath.row]
            
            if let image = imageCache[indexPath.row] {
                cell.iconView.image = image
            } else {
                cell.iconView.image = nil
                
                Task { [weak self] in
                    await self?.fetchImage(for: indexPath.row)
                    
                    DispatchQueue.main.async {
                        if let updatedCell = tableView.cellForRow(at: indexPath) as? FriendCell {
                            updatedCell.iconView.image = self?.imageCache[indexPath.row]
                        }
                    }
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        
        guard let sectionType = SectionType(rawValue: section) else { return nil }

        switch sectionType {
        case .profile:
            return "Profile"
        case .info:
            return "Info"
        case .friends:
            return "Friends"
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        guard let sectionType = SectionType(rawValue: indexPath.section) else { return }
        
        switch sectionType {
        case .profile:
            print("Profile tapped")
        case .info:
            print("Tapped \(infoData[indexPath.row])")
        case .friends:
            print("Tapped \(friendsData[indexPath.row])")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if SectionType(rawValue: indexPath.section) == .friends {
                Task { [weak self] in
                    await self?.fetchImage(for: indexPath.row)
                }
            }
        }
    }
}
