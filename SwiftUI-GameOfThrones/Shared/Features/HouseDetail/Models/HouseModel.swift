import Foundation

struct HouseModel: Equatable {
    var name: String = ""
    var region: String = ""
    var coatOfArms: String = ""
    var words: String = ""
    var titles: [String] = []
    var seats: [String] = []
    var currentLord: URL? = nil
    var heir: URL? = nil
    var overlord: URL? = nil
    var founded: String = ""
    var founder: URL? = nil
    var diedOut: String = ""
    var ancestralWeapons: [String] = []
    var cadetBranches: [URL] = []
    var swornMembers: [URL] = []

    init(name: String,
         region: String,
         coatOfArms: String,
         words: String,
         titles: [String],
         seats: [String],
         currentLord: URL?,
         heir: URL?,
         overlord: URL?,
         founded: String,
         founder: URL?,
         diedOut: String,
         ancestralWeapons: [String],
         cadetBranches: [URL],
         swornMembers: [URL]) {
        self.name = name
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
        self.titles = titles
        self.seats = seats
        self.currentLord = currentLord
        self.heir = heir
        self.overlord = overlord
        self.founded = founded
        self.founder = founder
        self.diedOut = diedOut
        self.ancestralWeapons = ancestralWeapons
        self.cadetBranches = cadetBranches
        self.swornMembers = swornMembers
    }
}
