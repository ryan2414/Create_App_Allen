//
//  ViewController.swift
//  ToDoApp
//
//  Created by 이승재 on 2023/06/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let toDoManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNaviBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func setupNaviBar() {
        self.title = "메모"
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
    }

    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "ToDoCell", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoManager.getToDoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        // 셀에 모델 전달
        let toDoData = toDoManager.getToDoListFromCoreData()
        cell.toDoData = toDoData[indexPath.row]
        
        cell.updateButtonPressed = { [weak self] (senderCell) in
            self?.performSegue(withIdentifier: "ToDoCell", sender: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDoCell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDoCell" {
            let detailVC = segue.destination as! DetailViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.toDoData = toDoManager.getToDoListFromCoreData()[indexPath.row]
        }
    }
    
    // 테이블뷰의 높이를 자동적으로 추정하도록 하는 메서드
    // (ToDo에서 메세지가 길때는 셀의 높이를 더 높게 --> 셀의 오토레이아웃 설정도 필요)
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
