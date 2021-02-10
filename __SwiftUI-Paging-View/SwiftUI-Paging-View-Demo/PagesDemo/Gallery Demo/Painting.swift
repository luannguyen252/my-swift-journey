import Foundation

struct Painting {
    var image: String
    var title: String
    var author: String
    var about: String
    var price: Int
}

let paintings = [
    Painting(image: "nighthawks",
             title: "Nighthawks",
             author: "Edward Hopper",
             about: "Nighthawks is a 1942 oil on canvas painting by Edward Hopper that portrays people in a downtown diner late at night "
                + "as viewed through the diner's large glass window. Also portrayed are the exteriors of the urban structures across the "
                + "street from the diner. It has been described as Hopper's best-known work and is one of the most recognizable paintings in "
                + "American art. Within months of its completion, it was sold to the Art Institute of Chicago on May 13, 1942 for $3,000.",
             price: 4350000),
    Painting(image: "gothic",
             title: "American Gothic",
             author: "Grant Wood",
             about: "American Gothic is a 1930 painting by Grant Wood in the collection of the Art Institute of Chicago. Wood was inspired "
                  + "to paint what is now known as the American Gothic House in Eldon, Iowa, along with \"the kind of people I fancied should live in that house\"."
                  + "It depicts a farmer standing beside his daughter – often mistakenly assumed to be his wife. "
                  + "The figures were modeled by Wood's sister Nan Wood Graham and their dentist Dr. Byron McKeeby. The woman is dressed in a colonial print "
                  + "apron evoking 20th-century rural Americana, and the man is holding a pitchfork. The plants on the porch of the house are mother-in-law's "
                  + "tongue and beefsteak begonia, which are the same as the plants in Wood's 1929 portrait of his mother Woman with Plants.",
             price: 2500000),
    Painting(image: "veteran",
             title: "The Veteran in a New Field",
             author: "Edward Hopper",
             about: "Painted soon after General Robert E. Lee’s surrender on April 9, 1865, and President Abraham Lincoln’s assassination five days later, "
                  + "Homer’s canvas depicts an emblematic farmer, revealed to be a Union veteran as well by his discarded jacket and canteen at the lower right. "
                  + "His old-fashioned scythe evokes the Grim Reaper, recalling the war’s harvest of death and expressing grief at Lincoln’s murder. "
                  + "A redemptive feature is the bountiful wheat -a northern crop- which could connote the Union’s victory. Referring to death and life, Homer’s iconic "
                  + "composition offers a powerful meditation on America’s sacrifices and its potential for recovery.",
             price: 7000000),
    Painting(image: "starrynight",
             title: "Starry Night",
             author: "Vincent Van Gogh",
             about: "The Starry Night is an oil on canvas by the Dutch post-impressionist painter Vincent van Gogh. Painted in June 1889, "
                  + "it describes the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence, just before sunrise, with the addition "
                  + "of an ideal village. It has been in the permanent collection of the Museum of Modern Art in New York City since 1941, acquired "
                  + "through the Lillie P. Bliss Bequest. Regarded as among Van Gogh's finest works, The Starry Night is one of the most recognized "
                  + "paintings in the history of Western culture.",
             price: 14500000)
]
