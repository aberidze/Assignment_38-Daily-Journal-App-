//
//  DailyNewsSceneViewModel.swift
//  DailyJournalApp
//
//  Created by Macbook Air 13 on 22.12.23.
//

import Foundation

final class DailyNewsSceneViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var date: Date = Date.now
    @Published var earliestDate : Date = Calendar.current.date(from: DateComponents(year: 1900)) ?? .now
    @Published var latestDate: Date = .now
    
    @Published var currentNews: [News] = []
    @Published var sheetIsShown = false
    
    
    // MARK: - Methods
    func publishNews() {
        let news = News(
            title: title,
            description: description,
            date: date
        )
        currentNews.append(news)
        // Empty the textfields:
        title = ""
        description = ""
        date = .now
        // Hide the sheet:
        sheetIsShown.toggle()
    }
    
    func removeNews(at index: IndexSet) {
        currentNews.remove(atOffsets: index)
    }
    
    func moveNews(from indexBefore: IndexSet, to indexAfter: Int) {
        currentNews.move(fromOffsets: indexBefore, toOffset: indexAfter)
    }
}
