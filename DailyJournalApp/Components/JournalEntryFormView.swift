//
//  JournalEntryFormView.swift
//  DailyJournalApp
//
//  Created by Macbook Air 13 on 22.12.23.
//

import SwiftUI

struct JournalEntryFormView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: DailyNewsSceneViewModel
    
    
    // MARK: - body
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("News Data") {
                    
                    TextField("Title", text: $viewModel.title)
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                        .frame(height: 150, alignment: .topLeading)
                    
                    DatePicker(
                        "Date",
                        selection: $viewModel.date,
                        in: viewModel.earliestDate...viewModel.latestDate,
                        displayedComponents: [.date]
                    )
                }
                
                Section {
                    
                    Button {
                        viewModel.publishNews()
                        
                    } label: {
                        
                        HStack(spacing: 10) {
                            Image(systemName: "paperplane.fill")
                            Text("Publish")
                        }
                    }
                    .listRowBackground(Color.black)
                    .foregroundColor(.white)
                }
            }
            .navigationTitle("Publish News")
        }
    }
}


// MARK: - Preview
struct JournalEntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryFormView(viewModel: DailyNewsSceneViewModel())
    }
}
