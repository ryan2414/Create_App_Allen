//
//  MusicCollectionViewCell.swift
//  MusicApp
//
//  Created by 이승재 on 2023/06/27.
//

import UIKit

final class MusicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UIImageView!
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard self.imageUrl! == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.collectionView.image = UIImage(data: data)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.collectionView.image = nil
    }
}

