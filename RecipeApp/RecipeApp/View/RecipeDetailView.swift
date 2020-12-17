//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: - PROPERTIES
    @ObservedObject var manager: RecipeManager
    @State var isIngredient = true
    public var viewSpace: Namespace.ID

    // MARK: - BODY
    var body: some View {
        ZStack {
            if manager.currentRecipeIndex % 2 == 0 {
                Color.lightBackground
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
            } else {
                Color.darkBackground
                    .ignoresSafeArea()
                    .transition(.move(edge: .bottom))
            }
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    //: RECIPE IMAGE VIEW
                    RecipeInteractionView(recipe: manager.selectedRecipe ?? manager.data[0], index: manager.currentRecipeIndex, count: manager.data.count, manager: manager, viewSpace: viewSpace)
                        .rotationEffect(.degrees(90))
                        .offset(y : -80)

                    Group {
                        //: RECIPE TITLE
                        Text(manager.selectedRecipe?.title ?? "?")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                        
                        //: RECIPE INFORMATION VIEW
                        HStack(spacing: 32) {
                            HStack(spacing: 12) {
                                Image(systemName: Data.summaryImageName["time"] ?? "?")
                                    .foregroundColor(.green)
                                Text(manager.selectedRecipe?.summery["time"] ?? "?")
                            } //: HSTACK
                            
                            HStack(spacing: 12) {
                                Image(systemName: Data.summaryImageName["ingredientCount"] ?? "?")
                                    .foregroundColor(.green)
                                Text(manager.selectedRecipe?.summery["ingredientCount"] ?? "?")
                            } //: HSTACK
                        }
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                        .padding(.vertical)
                    } //: GROUP
                    .padding(.horizontal)
                    
                    //: INGREDIENT/STEP TOGGLE VIEW
                    Toggle(isOn: $isIngredient, label: {})
                        .toggleStyle(IngredientMethodToggleStyle())
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                    
                    if isIngredient {
                        //: INGREDIENT LIST
                        IngredientListView(manager: manager)
                    } else {
                        //: STEP LIST
                        MethodListView(methods: manager.selectedRecipe?.instrusctions ?? ["?"])
                            .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
                    }
                }
            }

            BackButtonView(manager: manager)
                .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
        }
    }
}

// MARK: - BACK BUTTON
struct BackButtonView: View {
    // MARK: - PROPERTIES
    @ObservedObject var manager: RecipeManager

    // MARK: - BODY
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    manager.selectedRecipe = nil
                }
            }, label: {
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .bold))
                        .padding(24)
                    
                    Spacer()
                }
            })
            Spacer()
        } //: VSTACK
    }
}

// MARK: - INGREDIENT METHOD TOGGLE
struct IngredientMethodToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            VStack(alignment: .leading) {
                HStack {
                    Text("INGREDIENTS")
                        .font(.system(size: 16, weight: configuration.isOn ? .bold : .regular))
                        .frame(width: 110)
                        .fixedSize()
                        .animation(nil)
                        .padding(4)
                        .padding(.leading, 12)
                        .onTapGesture {
                            withAnimation {
                                configuration.isOn = true
                            }
                        }
                    
                    Text("METHOD")
                        .font(.system(size: 16, weight: configuration.isOn ? .regular : .bold))
                        .animation(nil)
                        .padding(4)
                        .onTapGesture {
                            withAnimation {
                                configuration.isOn = false
                            }
                        }
                } //: HSTACK
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 3)
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: configuration.isOn ? 110 : 70, height: 3)//110 : 70
                        .offset(x: configuration.isOn ? 16 : 140)//0 : 115
                } //: ZSTACK
        } //: VSTACK
    }
}

// MARK: - INGREDIENT LIST VIEW
struct IngredientListView: View {
    // MARK: - PROPERTIES
    @ObservedObject var manager: RecipeManager

    // MARK: - BODY
    var body: some View {
        ForEach(0..<manager.getCurrentRecipe().instrusctions.count) { i in
            Toggle(isOn: Binding<Bool>(
                get: { manager.data[manager.currentRecipeIndex].ingredients[i].available },
                set: { manager.data[manager.currentRecipeIndex].ingredients[i].available = $0 }
            ),
                   label: {
                    Text(manager.getCurrentRecipe().ingredients[i].title)
                        .foregroundColor(manager.currentRecipeIndex%2 == 0 ? .black : .white)
            })
            .toggleStyle(CircularToggleStyle())
            .padding(.vertical, 8)
        }
    }
}

// MARK: - CIRCULAR TOGGLE
struct CircularToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .stroke(configuration.isOn ? Color.green : Color.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if configuration.isOn {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 10, height: 10)
                    }
                } //: ZSTACK
                .padding(.horizontal)
                
                configuration.label
            } //: HSTACK
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
    }
}

// MARTK: - METHOD LIST VIEW
struct MethodListView: View {
    // MARK: - PROPERTIES
    let methods: [String]

    // MARK: - BODY
    var body: some View {
        ForEach(methods, id: \.self) { value in
            Text(value)
                .padding(.horizontal)
                .padding(.vertical, 4)
        }
    }
}
