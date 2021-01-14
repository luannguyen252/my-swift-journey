//
//  Flowers.swift
//  SwiftUIIntro-1
//
//  Created by Umer Khan on 19/10/2020.
//

/// associatedType An associated type gives a placeholder name to a type that is used as part of the protocol. The actual type to use for that associated type isn’t specified until the protocol is adopted

/// Opaquetype “A function or method with an opaque return type hides its return value’s type information.”

import Foundation
struct Flowers: Hashable {
    
    let name: String
    let imageName: String
    let description: String
}


let allFlowers = [
    Flowers(name: "Abutilon", imageName: "Abutilon", description: "Abutilon is a shrub that blooms during the summer. This plant produces flowers that may be white to a purple blue color.The blooms are saucer-shaped, and the stems have gray, hairy leaves. The shrub may grow to around 15 feet, and many hybrids have been developed that you can enjoy."),
    
    Flowers(name: "Acacia", imageName: "Acacia", description: "Acacias are soft, yellow flowers that tend to be fluffy. These plants are delicate and tender, growing best in sheltered gardens away from the cold frosts of northern climates.Also known as wattle, these tend to flower in early spring. They can get to be seven feet high if not properly pruned."),
    
    Flowers(name: "Aconite", imageName: "Aconite", description: "Aconite is a poisonous plant that is beautiful, which brings many people to plant it in their gardens. The flowers tend to be blue-purple or yellow in color, and the plant is native to mountainous areas.The scapes can grow tall, often getting to be at least three feet high, making them a great addition to the back of flower beds."),
    
    Flowers(name: "African Daisy", imageName: "African Daisy", description: "The African Daisy is a perennial with flowers that come in a variety of colors including red, gold, and blue.They are characterized by generally having a darker center, and the leaves are silvery in color. These flowers are great in cut flower arrangements or in the garden or as a container plant."),
    
    Flowers(name: "Agapanthus", imageName: "Agapanthus", description: "Agapanthus comes in a variety of colors and heights. These showy flowers are produced in colors such as blue and purple.The flower for an extended period of time, and they make a good border plant or addition to your container garden. They like sunlight, and some species are actually evergreen."),
    
    Flowers(name: "Ageratum", imageName: "Ageratum", description: "Ageratums are also known as the floss flower. These plants produce flowers that are fluffy and last for an extended period of time.The flowers come in colors such as pink and bicolor. They come in dwarf and tall varieties, so you can pick the best size for your edging or bedding."),
    
    Flowers(name: "Alchemilla", imageName: "Alchemilla", description: "Alchemilla is lady’s mantle, found throughout parts of America, Asia, and Europe. The plant’s flowers are yellow-green and last from early summer into fall.This herb can be used in foods such as salads, and, as an herb, it has many purported uses, such as for wound healing and breastfeeding."),
    
    Flowers(name: "Allium", imageName: "Allium", description: "Allium is a family of plants that includes onions, chives, and garlic. Ornamental varieties produce rounded flowers in several colors, including rosy purple.The flowers are long-lived even after being cut, so they make great additions to cut flower arrangements. They are typically planted in fall and bloom in spring and summer."),
    
    Flowers(name: "Alstroemeria", imageName: "Alstroemeria", description: "Alstroemeria is also called the Peruvian lily and is often grown commercially because the cut flowers last a long time.It is a perennial, and the flower spikes that bloom are 12 to 24 inches high. They can be grown in pots and come in a range of colors, including cream, orange, and red, oftentimes with spots of other colors.")
]
