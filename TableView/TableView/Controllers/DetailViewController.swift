//
//  DetailViewController.swift
//  TableView
//
//  Created by 이승재 on 2023/06/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var moiveData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        mainImageView.image = moiveData?.movieImage
        movieNameLabel.text = moiveData?.movieName
        descriptionLabel.text = moiveData?.movieDescription
    }

}
