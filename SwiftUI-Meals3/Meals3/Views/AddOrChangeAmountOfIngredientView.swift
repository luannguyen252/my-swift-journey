//
//  AddFoodView.swift
//  Meals3
//
//  Created by Uwe Petersen on 14.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI

fileprivate let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 3
    numberFormatter.minimum = 0
    return numberFormatter
}()

struct OneFingerRoationView: View {
    /// The value that is changed with the one finger rotation gesture
    @Binding var value: Double
    /// The size of the circle view that is used for the one finger roatione gesture
    var size: CGSize? = CGSize(width: 150.0, height: 150.0)
    /// Angle of the overall one finger rotation gesture
    @State var angle = Angle(degrees: 0.0)
    /// Angle between vector from center of view to last location of drag and vector from last to current location of drag. The sign of this angle determines whether the rotation direction is clockwise or counter clockwise.
    @State var angle2 = Angle(degrees: 0.0)
    /// length of the path of the one finger rotation gesture
    @State var distance = CGFloat(0.0)
    /// State of the one finger rotation drag.
    ///
    /// The following states are used:
    ///   - inactive: drag not yet started or already ended.
    ///   - began: drag has begun, but there is was only one inital (current) value. So we can store this to be used as old value when the next drag location is registered.
    ///   - oldLocationInitialized: there have been at least two drag values registerd, such that an old position could be set.
    enum DragState {
        case inactive, began, oldLocationInitilized
    }
    // State of the drag
    @GestureState var dragState: DragState = .inactive
    // Location of the previous touch
    @State var oldLocation = CGPoint()
    @State var translation = CGVector()

    var drag: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .updating($dragState) { value, gestureState, transaction in
                // use .updating only to change and adapt the state of the gesture
                switch gestureState {
                case .inactive:
                    gestureState = .began
                case .began:
                    gestureState = .oldLocationInitilized
                case .oldLocationInitilized:
                    break
                }
        }
        .onEnded {value in
            self.oldLocation = CGPoint(x: 0.0, y: 0.0)
            //            self.oldTranslation = CGVector(dx: 0.0, dy: 0.0)
        }
        .onChanged { value in
            switch self.dragState {
            case .began: // This is the first registered touch. Store as old location
                print("State: \(self.dragState), origin: \(value.startLocation), \(value.location)")
                self.oldLocation = CGPoint(x: value.location.x, y: value.location.y)
                print(String(format: "Loc. old: (%6.4f, %6.4f), new: (%6.4f, %6.4f)", self.oldLocation.x, self.oldLocation.y, value.location.x, value.location.y))
            case .oldLocationInitilized: // we have an old location and can now do all the drag calculation
                self.translation = CGVector(dx: value.location.x - self.oldLocation.x, dy: value.location.y - self.oldLocation.y)
                // Distance (length) from old location to the current location.
                let distance = sqrt((self.translation.dx * self.translation.dx) + (self.translation.dy * self.translation.dy))
                if distance >= 5 {
                    print("State: \(self.dragState), origin: \(value.startLocation), \(value.location)")
                    // This is important: To avoid jumps over 360 degrees, we transfer the translation vector into the coordinate system of the old translation vector. I.e. the x-axis of this coordinate system is the old translation vector. Then we determine the angle between the vector from the center of the view to the old location and the last drag segment.
                    self.angle2 = -Angle(radians: Double(atan2(self.oldLocation.y - 150.0, self.oldLocation.x - 150.0))) // Winkel oldTranslation gegenüber Mitte Kreis
                    let x = ( cos(self.angle2.radians) * Double(self.translation.dx) - sin(self.angle2.radians) * Double(self.translation.dy) )
                    let y = ( sin(self.angle2.radians) * Double(self.translation.dx) + cos(self.angle2.radians) * Double(self.translation.dy) )
                    let angle = Angle(radians: Double( atan2(y, x) ))
                    
                    self.angle += Angle(degrees: angle.degrees)
                    
                    self.distance = self.distance + 0.125 * (angle.degrees >= 0 ? distance : -distance)
                    
                    print(String(format: "Loc. old: (%6.4f, %6.4f), new: (%6.4f, %6.4f)", self.oldLocation.x, self.oldLocation.y, value.location.x, value.location.y))
                    print(String(format: "Trans. new: (%6.4f, %6.4f)", self.translation.dx, self.translation.dy))
                    print("x und y: (\(x), \(y)), angle2: \(self.angle2.degrees), angle: \(angle.degrees)")
                    print(String(format: "Angle: %6.2f, %6.3f delta: %6.2f ", self.angle.degrees, self.angle2.degrees, angle.degrees))
                    print(String(format: "Distance: %d, delta: %6.2f ,Start: (%6.2f, %6.2f)", Int(self.distance), distance, value.startLocation.x, value.startLocation.y))
                    print("")
                    
                    self.oldLocation = value.location
//                    let hugo = max(0.0, (self.amount?.doubleValue ?? 0.0) + 0.2 * (angle.degrees >= 0 ? Double(distance) : Double(-distance)) )
//                    self.amount = NSNumber(value: hugo)
                }
                case .inactive:
                    break
            }
        }
    }
    

    var body: some View {
        Text("schorsch")
    }
}


struct AddOrChangeAmountOfIngredientView: View {
    @Environment(\.managedObjectContext) var viewContext
    var food: Food
    var task: Task
    @Binding var isPresented: Bool
    @Binding var presentationModeOfParentView: PresentationMode

    @State private var amount: NSNumber? = nil
    
    private var amountBinding: Binding<String> {
        Binding<String> (
            get: { self.amount.map{ numberFormatter.string(from: $0) ?? "" } ?? "" },
            set: { self.amount = numberFormatter.number(from: $0) }
        )
    }

    
    @State var angle = Angle(degrees: 0.0)
    @State var angle2 = Angle(degrees: 0.0)
    @State var distance = CGFloat(0.0)
    @State var title = "Menge hinzufügen" // "Menge hinzufügen" for new food or "Menge ändern" for updating the amount of a food
    
    /// State of the one finger rotation drag.
    ///
    /// The following states are used:
    ///   - inactive: drag not yet started or already ended.
    ///   - began: drag has begun, but there is was only one inital (current) value. So we can store this to be used as old value when the next drag location is registered.
    ///   - oldLocationInitialized: there have been at least two drag values registerd, such that an old position could be set.
    enum DragState {
        case inactive, began, oldLocationInitilized
    }
    // State of the drag
    @GestureState var dragState: DragState = .inactive
    // Location of the previous touch
    @State var oldLocation = CGPoint()
    // Translation from the previous touch to the current touch
    @State var newTranslation = CGVector()
    // Animation of the plus icon, when rotation gesture finished (and stopped while rotating)
    @State private var isAnimatingSafeButton = false

    var drag: some Gesture {
        DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .updating($dragState) { value, gestureState, transaction in
                // use .updating only to change and adapt the state of the gesture
                switch gestureState {
                case .inactive:
                    gestureState = .began
                case .began:
                    gestureState = .oldLocationInitilized
                case .oldLocationInitilized:
                    break
                }
        }
        .onEnded {value in
            self.oldLocation = CGPoint(x: 0.0, y: 0.0)
            self.isAnimatingSafeButton = true
//            self.oldTranslation = CGVector(dx: 0.0, dy: 0.0)
        }
        .onChanged { value in
            self.isAnimatingSafeButton = false
            switch self.dragState {
            case .inactive:
                break
            case .began:
                print("State: \(self.dragState), origin: \(value.startLocation), \(value.location)")
                //                                        self.oldLocation = CGPoint(x: value.startLocation.x, y: value.startLocation.y)
                self.oldLocation = CGPoint(x: value.location.x, y: value.location.y)
                print(String(format: "Loc. old: (%6.4f, %6.4f), new: (%6.4f, %6.4f)", self.oldLocation.x, self.oldLocation.y, value.location.x, value.location.y))
            case .oldLocationInitilized:
                self.newTranslation = CGVector(dx: value.location.x - self.oldLocation.x, dy: value.location.y - self.oldLocation.y)
//                self.newTranslation = CGVector(dx: value.predictedEndLocation.x - self.oldLocation.x, dy: value.predictedEndLocation.y - self.oldLocation.y)
                let distance = sqrt((self.newTranslation.dx * self.newTranslation.dx) + (self.newTranslation.dy * self.newTranslation.dy))
                if distance >= 5 {
                    
                    print("State: \(self.dragState), origin: \(value.startLocation), \(value.location)")
                    self.angle2 = -Angle(radians: Double(atan2(self.oldLocation.y - 150.0, self.oldLocation.x - 150.0))) // Winkel oldTranslation gegenüber Mitte Kreis
                    let x = ( cos(self.angle2.radians) * Double(self.newTranslation.dx) - sin(self.angle2.radians) * Double(self.newTranslation.dy) )
                    let y = ( sin(self.angle2.radians) * Double(self.newTranslation.dx) + cos(self.angle2.radians) * Double(self.newTranslation.dy) )
                    let angle = Angle(radians: Double( atan2(y, x) ))
                    
                    self.angle += Angle(degrees: angle.degrees)
                    
                    self.distance = self.distance + 0.125 * (angle.degrees >= 0 ? distance : -distance)

                    print(String(format: "Loc. old: (%6.4f, %6.4f), new: (%6.4f, %6.4f)", self.oldLocation.x, self.oldLocation.y, value.location.x, value.location.y))
                    print(String(format: "Trans. new: (%6.4f, %6.4f)", self.newTranslation.dx, self.newTranslation.dy))
                    print("x und y: (\(x), \(y)), angle2: \(self.angle2.degrees), angle: \(angle.degrees)")
                    print(String(format: "Angle: %6.2f, %6.3f delta: %6.2f ", self.angle.degrees, self.angle2.degrees, angle.degrees))
                    print(String(format: "Distance: %d, delta: %6.2f ,Start: (%6.2f, %6.2f)", Int(self.distance), distance, value.startLocation.x, value.startLocation.y))
                    print("")
                    
                    self.oldLocation = value.location
                    let hugo = max(0.0, (self.amount?.doubleValue ?? 0.0) + 0.2 * (angle.degrees >= 0 ? Double(distance) : Double(-distance)) ).rounded()
                    self.amount = hugo <= 0.0000001 ? nil : NSNumber(value: hugo) // if amount is zero -> make it nil to show the placeholder (and do not allow to store the value)
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationView() {
            GeometryReader() { geometry in
                
                Form {
                    Section(header: Text("Lebensmittel"), footer: Text(" ")) {
                        Text(self.food.name ?? " ")
                    }
                    
                    Section(header: Text("Menge in der Mahlzeit"), footer: Text(" ")) {
                        HStack {
                            Spacer()
                            TextField("g", text: self.amountBinding)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .scaledToFit()
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    }
                    
                    Section(header: Text(" ")) {
                        
                        HStack {
                            Spacer()
                            ZStack {
//                                Rectangle()
//                                    .frame(width: geometry.size.width, height: geometry.size.height)
//                                    .foregroundColor(Color.red)
                                Rectangle().frame(width: 10, height: 400) // Add some vertical space
                                    .opacity(0.0)
                                Circle()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300) // Not bigger than 300 by 300
//                                    .frame(width: geometry.size.width * self.circleScaleFactor, height: geometry.size.width * self.circleScaleFactor) // Not bigger than 300 by 300
                                    .foregroundColor(Color(.systemFill))
                                Image(systemName: "arrow.2.circlepath")
                                    .resizable()
                                    .foregroundColor(Color(.systemBackground))
                                    .frame(width: 200*1.1, height: 170*1.1)
//                                    .frame(width: geometry.size.width * self.arrowsScaleFactor, height: geometry.size.width * self.arrowsScaleFactor * self.arrowsAspectRatio)
                                Button("Speichern", action:{ self.save() }).padding()
                                    .foregroundColor(Color(.systemBlue))
                                    .scaleEffect(self.isAnimatingSafeButton ? 1.25 : 1.0) // animate when rotation finished
                                    .animation(Animation.default.repeat(while: self.isAnimatingSafeButton))
                            }
                            Spacer()
                        }
                        .gesture(self.drag)
                            .onTapGesture { self.save() } // Tapping anywhere saves.
                    }
                }
            }
            .onAppear() {
                switch self.task {
                case .changeAmountOfIngredient(let ingredient):
                    self.amount = ingredient.amount
                    self.title = "Menge ändern"
                default: break
                }
            }
            .navigationBarTitle(Text(self.title), displayMode: .inline)
            .navigationBarItems(leading:
                Button("Zurück") { self.isPresented = false }.padding(),
                                trailing:
                Button("Speichern") {
                    self.save()
                }.padding()
            )
        }
        .onTapGesture(count: 2) {
            self.save()
        }
    }
    
    
    // MARK: - Constants
    let circleScaleFactor: CGFloat = 0.8
    let arrowsScaleFactor: CGFloat = 0.6
    let arrowsAspectRatio: CGFloat = 0.85
    let verticalSpacing: CGFloat = 20
    
    
    func save() {
        if let amount = self.amount {
            switch task {
            case .addAmountOfFoodToIngredientCollection(let ingredientCollection):
                    ingredientCollection.addIngredient(food: self.food, amount: amount, managedObjectContext: self.viewContext)
                    if let meal = ingredientCollection as? Meal {
                        meal.objectWillChange.send()
                        meal.dateOfLastModification = Date()
                        try? self.viewContext.save()
                        HealthManager.synchronize(meal, withSynchronisationMode: .update)
                        self.isPresented = false // dismiss self
                        self.$presentationModeOfParentView.wrappedValue.dismiss() // dismiss parent view (food details), too
                    } else if let recipe = ingredientCollection as? Recipe {
                        recipe.objectWillChange.send()
                        recipe.dateOfLastModification = Date()
//                        recipe.food?.updateNutrients(managedObjectContext: self.viewContext)
                        recipe.food?.updateNutrients(amount: .sumOfAmountsOfRecipeIngredients, managedObjectContext: self.viewContext)

                        try? self.viewContext.save()
                        self.isPresented = false // dismiss self
                        self.$presentationModeOfParentView.wrappedValue.dismiss() // dismiss parent view (food details), too
//                        print("Recipestuff")
//                        print(recipe.amount ?? "")
//                        print(recipe.amountOfAllIngredients)
                    }
            case .changeAmountOfIngredient(var ingredient):
                ingredient.amount = self.amount
                if let meal = (ingredient as? MealIngredient)?.meal {
                    meal.dateOfLastModification = Date()
                    HealthManager.synchronize(meal, withSynchronisationMode: .update)
                } else if let recipe = (ingredient as? RecipeIngredient)?.recipe {
                    recipe.objectWillChange.send()

                    recipe.dateOfLastModification = Date()
//                    recipe.food?.updateNutrients(managedObjectContext: viewContext)
                    recipe.food?.updateNutrients(amount: .sumOfAmountsOfRecipeIngredients, managedObjectContext: viewContext)
//                    recipe.objectWillChange.send()

//                    print("Recipestuff")
//                    print(recipe.amount ?? "")
//                    print(recipe.amountOfAllIngredients)
                }
                try? viewContext.save()
                isPresented = false // dismiss self
            }
        }
    }
    
    // MARK: - Constants
    
}


extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}



struct AddFoodView_Previews: PreviewProvider {
    
    
    // NOTE: This view must bbe previewed from its parent view "FoodDetail".
    //       This is due to that I did not manage to create a Binding to the environment var presentationMode (which is read only)
    
    @Environment(\.presentationMode) static var presentationMode: Binding<PresentationMode>

    static var previews: some View {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let food: Food = {
            let food = Food(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            food.name = "leckerer Donut"
            food.comment = "Ein unnötiger Kommentar"
            food.totalCarb = 12.0
            food.totalFat = 23.0
            food.totalProtein = 14.0
            food.totalEnergyCals = 200.0
            food.totalAlcohol = 4.0
            food.totalWater = 55.0
            food.totalDietaryFiber = 32.0
            food.totalOrganicAcids = 0.4
            food.totalSalt = 0.3
            food.dateOfLastModification = Date()
            food.carbGlucose = 12.0

            return food
        }()

        let meal = Meal.newestMeal(managedObjectContext: context)

        return AddOrChangeAmountOfIngredientView(food: food,
                                           task: .addAmountOfFoodToIngredientCollection(meal as IngredientCollection),
                                           isPresented: .constant(true),
                                           presentationModeOfParentView: presentationMode)
            .environment(\.managedObjectContext, context)
    }
}
