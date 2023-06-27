//
//  ViewController.swift
//  MusicApp
//
//  Created by 이승재 on 2023/06/27.
//

import UIKit

class ViewController: UIViewController {
    
    //let searchController = UISearchController()
    
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    @IBOutlet weak var musicTableView: UITableView!
    
    var networkManager = NetworkManager.shared
    
    var musicArrays: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSearchBar()
        setupTableView()
        setupDatas()
        
    }
    
    func setUpSearchBar() {
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        //searchController.searchBar.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        
    }

    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    func setupDatas() {
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            print(#function)
            switch result {
            case .success(let musicDatas):
                print("데이터 받았음")
                self.musicArrays = musicDatas
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return self.musicArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.artistNameLabel.text = musicArrays[indexPath.row].artistName
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.releaseDateName.text = musicArrays[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    //테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    //musicTableView.rowHeight = 120 대신에 사용 가능
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
//
//extension ViewController: UISearchBarDelegate {
//    //유저가 글자를 입력하는 순간마다 호출되는 메서드
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//        self.musicArrays = []
//
//        networkManager.fetchMusic(searchTerm: searchText) { result in
//            switch result {
//            case .success(let musicDatas):
//                self.musicArrays = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
    // 검색(Search) 버튼을 눌렀을 때 호출 되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchController.searchBar.text else {
//            return
//        }
//
//        print(text)
//
//        self.musicArrays = []
//
//        networkManager.fetchMusic(searchTerm: text) { result in
//            switch result {
//            case .success(let musicDatas):
//                self.musicArrays = musicDatas
//                DispatchQueue.main.async {
//                    self.musicTableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        self.view.endEditing(true)
//    }
//}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("서치바에 입력되는 단어", searchController.searchBar.text ?? "")
        
        let vc = searchController.searchResultsController as! SearchResultViewController
        vc.searchTerm = searchController.searchBar.text ?? ""
    }
}
