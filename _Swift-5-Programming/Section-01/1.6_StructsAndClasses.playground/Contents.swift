import UIKit

//Define a class
//Define methods
//Define computed property
//Use subscripts to access values of class


class Result {
    var subjects = [String]()
    var numberOfSubjects: Int {
        return subjects.count
    }
    
    var scores = [String: Int]()
    
    
    
    func assignScore(subjectName: String, score: Int) {
        scores[subjectName] = score
    }
    
    
    func printScores() {
        for key in scores.keys {
            if let scoreValue = scores[key] {
                print("\(key): \(scoreValue)")
            }
        }
    }
}

let result = Result()
result.subjects = ["English", "Science"]
result.assignScore(subjectName: "English", score: 56)
result.assignScore(subjectName: "Science", score: 66)

result.printScores()
print(result.numberOfSubjects)

