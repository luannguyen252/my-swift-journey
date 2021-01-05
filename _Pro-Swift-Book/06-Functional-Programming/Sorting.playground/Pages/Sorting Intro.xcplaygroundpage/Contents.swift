import UIKit


func solution1(using scores: [String]) -> [String] {
    return scores.sorted()
}


func solution2(using scores: [String]) -> [Int] {
    return scores
        .compactMap { Int($0) }
        .sorted()
}



func solution3(using scores: [String]) -> [String] {
    return scores.sorted { (score1, score2) -> Bool in
        guard
            let number1 = Int(score1),
            let number2 = Int(score2)
        else {
            return false
        }
        
        return number1 < number2
    }
}



func solution4(using scores: [String]) -> [Int] {
    return scores
        .compactMap { Int($0) }
        .sorted()
}


let scores = ["212", "12", "9912", "085", "2974", "8"]


print(solution1(using: scores))
print(solution2(using: scores))
print(solution3(using: scores))
print(solution4(using: scores))
