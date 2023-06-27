//
//  Constants.swift
//  MusicApp
//
//  Created by 이승재 on 2023/06/27.
//

import Foundation

//MARK: - Name Space 만들기

public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}

public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {}//인스턴스 못하게 막음
}
