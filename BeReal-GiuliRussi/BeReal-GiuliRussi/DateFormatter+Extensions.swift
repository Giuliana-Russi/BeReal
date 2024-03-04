//
//  DateFormatter+Extensions.swift
//  BeReal-GiuliRussi
//
//  Created by Giuliana Russi on 3/4/24.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
