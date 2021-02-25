//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import Foundation

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name = ""
    var imageName = ""
    var isFavorite = false
    var details = ""
    var location = ""
}

class Data {
    static func getFruits() -> [Item] {
        return [
            Item(name: "Avocado", imageName: "Avocado"),
            Item(name: "Banana", imageName: "Banana"),
            Item(name: "Blackberries", imageName: "Blackberries"),
            Item(name: "Cherry", imageName: "Cherry"),
            Item(name: "Coconut", imageName: "Coconut"),
            Item(name: "Kiwi", imageName: "Kiwi"),
            Item(name: "Lemon", imageName: "Lemon"),
            Item(name: "Lime", imageName: "Lime"),
            Item(name: "Mango", imageName: "Mango"),
            Item(name: "Mangosteen", imageName: "Mangosteen"),
            Item(name: "Orange", imageName: "Orange"),
            Item(name: "Peach", imageName: "Peach"),
            Item(name: "Pineapple", imageName: "Pineapple"),
            Item(name: "Prune", imageName: "Prune"),
            Item(name: "Raspberry", imageName: "Raspberry")
        ]
    }
    
    static func getUtahNationalParks() -> [Item] {
        return [
            Item(name: "Arches", imageName: "Arches", details: "Arches National Park lies north of Moab in the state of Utah. Bordered by the Colorado River in the southeast, it’s known as the site of more than 2,000 natural sandstone arches, such as the massive, red-hued Delicate Arch in the east. Long, thin Landscape Arch stands in Devils Garden to the north. Other geological formations include Balanced Rock, towering over the desert landscape in the middle of the park.", location: "Moab, UT"),
            Item(name: "Bryce Canyon", imageName: "BryceCanyon", details: "Bryce Canyon National Park, a sprawling reserve in southern Utah, is known for crimson-colored hoodoos, which are spire-shaped rock formations. The park’s main road leads past the expansive Bryce Amphitheater, a hoodoo-filled depression lying below the Rim Trail hiking path. It has overlooks at Sunrise Point, Sunset Point, Inspiration Point and Bryce Point. Prime viewing times are around sunup and sundown.", location: "Bryce, UT"),
            Item(name: "Canyonlands", imageName: "Canyonlands", details: "Canyonlands National Park in southeastern Utah is known for its dramatic desert landscape carved by the Colorado River. Island in the Sky is a huge, flat-topped mesa with panoramic overlooks. Other notable areas include the towering rock pinnacles known as the Needles, the remote canyons of the Maze and the Native American rock paintings in Horseshoe Canyon. Whitewater rapids flow through Cataract Canyon.", location: "Moab, UT"),
            Item(name: "Capitol Reef", imageName: "CapitolReef", details: "Capitol Reef National Park is in Utah's south-central desert. It surrounds a long wrinkle in the earth known as the Waterpocket Fold, with layers of golden sandstone, canyons and striking rock formations. Among the park's sights are the Chimney Rock pillar, the Hickman Bridge arch, and Capitol Reef, known for its white sandstone domes. In the north are the towering monoliths of Cathedral Valley.", location: "Torrey, UT"),
            Item(name: "Cedar Breaks", imageName: "CedarBreaks", details: "Cedar Breaks National Monument is a U.S. National Monument located in the U.S. state of Utah near Cedar City. Cedar Breaks is a natural amphitheater, stretching across 3 miles, with a depth of over 2,000 feet. The elevation of the rim of the amphitheater is over 10,000 feet above sea level.", location: "Brian Head, UT"),
            Item(name: "Goblin Valley", imageName: "GoblinValley", details: "Goblin Valley State Park is a state park of Utah, in the United States. The park features thousands of hoodoos, referred to locally as goblins, which are formations of mushroom-shaped rock pinnacles, some as tall as several yards.", location: "Green River, UT"),
            Item(name: "Zion", imageName: "Zion", details: "Zion National Park is a southwest Utah nature preserve distinguished by Zion Canyon’s steep red cliffs. Zion Canyon Scenic Drive cuts through its main section, leading to forest trails along the Virgin River. The river flows to the Emerald Pools, which have waterfalls and a hanging garden. Also along the river, partly through deep chasms, is Zion Narrows wading hike.", location: "Springdale, UT")
        ]
    }
}
