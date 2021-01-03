//
//  CategoriesList.swift
//  WatchQuizApp WatchKit Extension
//
//  Created by Gualtiero Frigerio on 10/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct CategoryRow : View {
    var category:Category
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.title)
                .font(.title)
                .foregroundColor(CommonUtility.colorFromString(colorString: category.color))
            Spacer()
            Text("\(category.questions.count) questions")
        }.padding()
    }
}

struct CategoriesList : View {
    var dataSource:DataSource
    
    var body: some View {
        List(dataSource.categories, id:\.title) { category in
            NavigationLink(destination:QuestionsList(model:QuestionsListModel(category: category))) {
                CategoryRow(category:category)
            }
            }
        .listStyle(CarouselListStyle())
        .navigationBarTitle("Categories")
    }
}

#if DEBUG
struct CategoriesList_Previews : PreviewProvider {
    static var previews: some View {
        CategoriesList(dataSource: DataSource())
    }
}
#endif
