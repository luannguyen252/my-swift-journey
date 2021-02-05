//
//  Search.swift
//  Meals3
//
//  Created by Uwe Petersen on 23.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
import Combine
import CoreData

class Search: ObservableObject {
    @Published var text: String = "" {
        didSet {
            fetchOffset = 0
//            print("did set fetchoffset to zero")
        } // Enforces refetch of data if search string is modified
    }
    @Published var filter: SearchFilter = .Contains
    @Published var sortRule: FoodListSortRule = .NameAscending
    @Published var selection: FoodListSelection = .All
//    @Published var selection: FoodListSelection = .LastWeek
    var fetchLimit: Int = 25
    @Published var fetchOffset: Int = 0
    
//    @Published var debouncedText: String = "" {
//        didSet {
//            print("The debounced text: \(debouncedText)")
//        }
//    }
//    
//    private var cancellable = Set<AnyCancellable>()
//    init() {
////        $text.throttle(for: .seconds(0.4), scheduler: RunLoop.main, latest: true)
//        $text.debounce(for: .seconds(0.1), scheduler: RunLoop.main)
////            .filter{$0.count != 1}
////            .assign(to: \.debouncedText, on: self)
//            .sink { [weak self] (newString) in
//                if newString.count != 1 {
//                    self?.debouncedText = newString
//                }
//        }
//        .store(in: &cancellable)
//    }
    
    
    /// Returns a NSFetchRequest for foods that matches the search.
    ///
    /// Batch size, offset, limit and other properties are chosen such to achieve speed performance when scrolling the resulting list with SwiftUI.
    /// - Returns: NSFetchRequest
    func foodsFetchRequest() -> NSFetchRequest<Food> {
        let predicates = [selection.predicate, filter.predicateForSearchText(text)].compactMap{$0}
        
        let request = NSFetchRequest<Food>(entityName: "Food")
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        request.sortDescriptors = sortRule.sortDescriptors
        request.returnsObjectsAsFaults = true   // objects are only loaded, when needed/used -> faster but more frequent disk reads
        request.includesPropertyValues = true   // usefull only, when only relevant properties are read
        
        request.fetchBatchSize = 50
        request.fetchOffset = fetchOffset // needed for paging through results
        request.fetchLimit = fetchLimit   // Speeds up a lot, especially inital loading of this view controller, but needs care
        request.propertiesToFetch = ["name", "totalEnergyCals", "totalCarb", "totalProtein", "totalFat", "carbFructose", "carbGlucose"]   // read only certain properties (others are fetched automatically on demand)
        return request
    }


    
}
