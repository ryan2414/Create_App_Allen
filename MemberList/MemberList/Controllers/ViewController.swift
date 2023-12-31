//
//  ViewController.swift
//  MemberList
//
//  Created by 이승재 on 2023/06/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstraints()
        
    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        tableView.reloadData()
//    }
//    
    private func setupNaviBar() {
        title = "회원목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    private func setupDatas() {
        memberListManager.makeMebersListDatas()
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        
        detailVC.delegate = self
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemeberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
       
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        detailVC.delegate = self
        
        let currentMember = memberListManager.getMemeberList()[indexPath.row]
        detailVC.member = currentMember
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension ViewController: MemeberDelegate {
    func addNewMember(_ member: Member) {
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        print("업데이트")
        
        memberListManager.updateMemeberInfo(index: index, member)
        tableView.reloadData()
    }
}
