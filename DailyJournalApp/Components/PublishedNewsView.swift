//
//  NewsView.swift
//  DailyJournalApp
//
//  Created by Macbook Air 13 on 26.12.23.
//

import SwiftUI

struct PublishedNewsView: View {
    
    // MARK: - Properties
    @State var news: News
    
    
    // MARK: - body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(news.title)
                    .font(.headline)
                
                Spacer()
            }
            
            HStack {
                Text(news.description)
                    .font(.subheadline)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(news.date, style: .date)
                Text(news.date, style: .time)
            }
            .italic()
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
    }
}


// MARK: - Preview
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedNewsView(news: News(title: "News Title", description: "This is a detailed description of what has happened", date: .now))
    }
}
