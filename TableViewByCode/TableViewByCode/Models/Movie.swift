//
//  Movie.swift
//  TableViewByCode
//
//  Created by 이승재 on 2023/06/22.
//

import UIKit

struct Movie {
    var movieImage: UIImage? // 이미지의 경우 불러오기 실패할 경우가 있음으로 Optional 처리
    let movieName: String
    let movieDescription: String
}
