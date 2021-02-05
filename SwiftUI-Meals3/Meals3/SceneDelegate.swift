//
//  SceneDelegate.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData


//class CurrentIngredientCollection: ObservableObject {
//    @Published var collection: IngredientCollection
//    init(_ value: IngredientCollection) {
//        self.collection = value
//    }
////    init(context: NSManagedObjectContext) {
////        self.currentIngredientCollection = Meal.newestMeal(managedObjectContext: context)
////    }
//}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Get the managed object context from the shared persistent container
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy // recommendation from hackingwithswift.com

        // The meal to which foods will be added to as ingredients.
        // Has to be changed, if a new meal is created or the current meal is deleted.
        let currentMeal = CurrentMeal(Meal.newestMeal(managedObjectContext: context))

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath
        let search = Search()
        let contentView = ContentView(search: search)
            .environment(\.managedObjectContext, context)
            .environmentObject(currentMeal)

        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            window.rootViewController = UIHostingController(rootView: contentView)
            
            // Speed up all animations (view transitions)
            window.layer.speed = 2.0
            
            // Resign keyboard on pan gesture, modified version of https://stackoverflow.com/a/60010955/3687284
//            let panGesture = AnyPanGestureRecognizer(target: self, action: nil)
            let panGesture = AnyPanGestureRecognizer(target: self, action:#selector(handlePan(sender:)))
            panGesture.requiresExclusiveTouchType = false
            panGesture.cancelsTouchesInView = false
            panGesture.delegate = self //I don't use window as delegate to minimize possible side effects
            window.addGestureRecognizer(panGesture)

            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

// Resign keyboard on pan gesture, modified version of https://stackoverflow.com/a/60010955/3687284
extension SceneDelegate: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            print("handle pan, changed")
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            sender.state = .ended // Job is done, gesture can be ended.
        }
    }
}

