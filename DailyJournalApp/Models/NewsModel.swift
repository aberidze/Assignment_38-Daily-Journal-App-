//
//  NewsModel.swift
//  DailyJournalApp
//
//  Created by Macbook Air 13 on 22.12.23.
//

import Foundation

final class News: Identifiable, Hashable {
    
    // MARK: - Properties
    var id = UUID()
    let title: String
    let description: String
    let date: Date
    
    
    // MARK: - Initializer
    init(title: String, description: String, date: Date) {
        self.title = title
        self.description = description
        self.date = date
    }
    
    
    
    // MARK: - Hashable Protocol
    static func == (lhs: News, rhs: News) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + description + date.description)
    }
}
