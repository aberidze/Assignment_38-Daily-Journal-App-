//
//  DailyNewsScene.swift
//  DailyJournalApp
//
//  Created by Macbook Air 13 on 22.12.23.
//

import SwiftUI

struct DailyNewsSceneView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = DailyNewsSceneViewModel()
    
    
    // MARK: - body
    var body: some View {
        
        NavigationStack {
            
            List {
                
                if viewModel.currentNews.isEmpty {
                    Text("No News Published")
                    
                } else {
                    
                    ForEach(viewModel.currentNews) { news in
                        PublishedNewsView(news: news)
                    }
                    .onMove(perform: viewModel.moveNews)
                    .onDelete(perform: viewModel.removeNews)
                }
            }
            .navigationTitle("News Feed")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        viewModel.sheetIsShown.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $viewModel.sheetIsShown) {
            JournalEntryFormView(viewModel: viewModel)
        }
    }
}


// MARK: - Preview
struct DailyNewsScene_Previews: PreviewProvider {
    static var previews: some View {
        DailyNewsSceneView()
    }
}
