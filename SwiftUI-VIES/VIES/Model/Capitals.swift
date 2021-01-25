import Foundation
import MapKit

struct Capital: Identifiable, Hashable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
}

extension Capital {
    static let all: [Capital] = [  ]
    static let vienna = Capital(latitude: 48.210033, longitude: 16.363449)
    static let brussels = Capital(latitude: 50.8466337, longitude: 4.3522251)
    static let sofia = Capital(latitude: 42.697387, longitude: 23.32406)
    static let nicosia = Capital(latitude: 35.1666667, longitude: 33.3666667)
    static let prague = Capital(latitude: 50.0870734, longitude: 14.4176778)
    static let berlin = Capital(latitude: 52.5177795, longitude: 13.4098392)
    static let copenhagen = Capital(latitude: 55.6751148, longitude: 12.5690988)
    static let tallinn = Capital(latitude: 59.4328402, longitude: 24.7439894)
    static let athens = Capital(latitude: 37.9818899, longitude: 23.7274284)
    static let madrid = Capital(latitude: 40.416775, longitude: -3.703790)
    static let helsinki = Capital(latitude: 60.1738024, longitude: 24.9384889)
    static let paris = Capital(latitude: 48.8566419, longitude: 2.3518481)
    static let zagreb = Capital(latitude: 45.8011745, longitude: 15.9785517)
    static let budapest = Capital(latitude: 47.4966138, longitude: 19.0539931)
    static let dublin = Capital(latitude: 53.3441204, longitude: 6.2673368)
    static let rome = Capital(latitude: 41.8938353, longitude: 12.4818752)
    static let vilnius = Capital(latitude: 54.6782762, longitude: 25.2874374)
    static let luxembourg = Capital(latitude: 49.7775853, longitude: 6.0948057)
    static let riga = Capital(latitude: 56.9475636, longitude: 24.1060604)
    static let valletta = Capital(latitude: 35.8997222, longitude: 14.5147222)
    static let amsterdam = Capital(latitude: 52.3673008, longitude: 4.8998197)
    static let warsaw = Capital(latitude: 52.2431744, longitude: 21.0018102)
    static let lisbon = Capital(latitude: 38.7083585, longitude: 9.1388829)
    static let bucharest = Capital(latitude: 44.4267347, longitude: 26.1040483)
    static let stockholm = Capital(latitude: 59.334591, longitude: 18.063240)
    static let ljubljana = Capital(latitude: 46.056946, longitude: 14.505751)
    static let bratislava = Capital(latitude: 48.148598, longitude: 17.107748)
}
