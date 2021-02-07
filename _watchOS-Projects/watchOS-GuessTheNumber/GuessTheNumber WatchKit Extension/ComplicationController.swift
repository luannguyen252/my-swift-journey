//
//  ComplicationController.swift
//  GuessTheNumber WatchKit Extension
//
//  Created by McCoy Zhu on 5/10/20.
//  Copyright © 2020 McCoy Zhu. All rights reserved.
//

import ClockKit
import WatchKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Helper Methods
    
    func complicationTemplate(for complication: CLKComplication) -> CLKComplicationTemplate? {
        func template(for family: CLKComplicationFamily, withImage image: UIImage? = nil, withTextProvider textProvider: CLKSimpleTextProvider? = nil) -> CLKComplicationTemplate? {
            switch family {
                case .circularSmall:
                    let tmpl = CLKComplicationTemplateCircularSmallSimpleImage()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Circular")!)
                    return tmpl
                    
                case .extraLarge:
                    let tmpl = CLKComplicationTemplateExtraLargeSimpleImage()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Extra Large")!)
                    return tmpl
                    
                case .graphicBezel:
                    let circularTmpl = CLKComplicationTemplateGraphicCircularImage()
                    circularTmpl.imageProvider = CLKFullColorImageProvider(fullColorImage: image ?? UIImage(named: "Complication/Graphic Bezel")!, tintedImageProvider: CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Graphic Bezel")!))
                    let tmpl = CLKComplicationTemplateGraphicBezelCircularText()
                    tmpl.circularTemplate = circularTmpl
                    tmpl.textProvider = textProvider ?? CLKSimpleTextProvider(text: NSLocalizedString("Guess The Number", comment: ""), shortText:  NSLocalizedString("Guess", comment: ""))
                    return tmpl
                    
                case .graphicCircular:
                    let tmpl = CLKComplicationTemplateGraphicCircularImage()
                    tmpl.imageProvider = CLKFullColorImageProvider(fullColorImage: image ?? UIImage(named: "Complication/Graphic Circular")!, tintedImageProvider: CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Graphic Circular")!))
                    return tmpl
                    
                case .graphicCorner:
                    let tmpl = CLKComplicationTemplateGraphicCornerTextImage()
                    tmpl.imageProvider = CLKFullColorImageProvider(fullColorImage: image ?? UIImage(named: "Complication/Graphic Corner")!, tintedImageProvider: CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Graphic Corner")!))
                    tmpl.textProvider = textProvider ?? CLKSimpleTextProvider(text: NSLocalizedString("Guess The Number", comment: ""), shortText:  NSLocalizedString("Guess", comment: ""))
                    return tmpl
                    
                case .modularSmall:
                    let tmpl = CLKComplicationTemplateModularSmallSimpleImage()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Modular")!)
                    return tmpl
                    
                case .utilitarianSmall:
                    let tmpl = CLKComplicationTemplateUtilitarianSmallSquare()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Complication/Utilitarian")!)
                    return tmpl
                    
                case .utilitarianSmallFlat:
                    let tmpl = CLKComplicationTemplateUtilitarianSmallFlat()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Utilitatian Flat")!)
                    tmpl.textProvider = textProvider ?? CLKSimpleTextProvider(text: NSLocalizedString("Guess The Number", comment: ""), shortText:  NSLocalizedString("Guess", comment: ""))
                    return tmpl
                    
                case .utilitarianLarge:
                    let tmpl = CLKComplicationTemplateUtilitarianLargeFlat()
                    tmpl.imageProvider = CLKImageProvider(onePieceImage: image ?? UIImage(named: "Utilitatian Flat")!)
                    tmpl.textProvider = textProvider ?? CLKSimpleTextProvider(text: NSLocalizedString("Guess The Number", comment: ""), shortText:  NSLocalizedString("Guess", comment: ""))
                    return tmpl
                    
                default:
                    return nil
            }
        }
        
        func symbol(for action: GuessData.QuickAction) -> UIImage? {
            switch action {
                case .letMeGuess:
                    return UIImage(systemName: "person.crop.circle.fill")
                case .letAiGuess:
                    return UIImage(systemName: "gamecontroller.fill")
                case .randomizer:
                    return UIImage(systemName: "dial.fill")
                case .randomNumber:
                    return UIImage(systemName: "textformat.123")
                case .randomColor:
                    return UIImage(systemName: "paintbrush")
                case .randomBoolean:
                    return UIImage(systemName: "questionmark.circle")
                default:
                    return nil
            }
        }
        
        func symbolSize(for family: CLKComplicationFamily) -> CGSize? {
            enum DeviceSize {
                case small, medium, large
            }
            
            var deviceSize: DeviceSize
            
            let screenWidth = WKInterfaceDevice.current().screenBounds.size.width
            if Int(screenWidth * 2) == 272 {
                deviceSize = .small
            } else if Int(screenWidth * 2) == 368 {
                deviceSize = .large
            } else {
                deviceSize = .medium
            }
            
            switch (family, deviceSize) {
                // circularSmall
                case (.circularSmall, .small):
                    return CGSize(width: 32 / 2, height: 32 / 2)
                case (.circularSmall, .medium):
                    return CGSize(width: 36 / 2, height: 36 / 2)
                case (.circularSmall, .large):
                    return CGSize(width: 40 / 2, height: 40 / 2)
                    
                // extraLarge
                case (.extraLarge, .small):
                    return CGSize(width: 182 / 2, height: 182 / 2)
                case (.extraLarge, .medium):
                    return CGSize(width: 203 / 2, height: 203 / 2)
                case (.extraLarge, .large):
                    return CGSize(width: 224 / 2, height: 224 / 2)
                    
                // graphic
                case (.graphicBezel, .medium), (.graphicCircular, .medium):
                    return CGSize(width: 84 / 2, height: 84 / 2)
                case (.graphicBezel, .large), (.graphicCircular, .large):
                    return CGSize(width: 94 / 2, height: 94 / 2)
                    
                // graphicCorner
                case (.graphicCorner, .medium):
                    return CGSize(width: 40 / 2, height: 40 / 2)
                case (.graphicCorner, .large):
                    return CGSize(width: 44 / 2, height: 44 / 2)
                    
                // modularSmall
                case (.modularSmall, .small):
                    return CGSize(width: 52 / 2, height: 52 / 2)
                case (.modularSmall, .medium):
                    return CGSize(width: 58 / 2, height: 58 / 2)
                case (.modularSmall, .large):
                    return CGSize(width: 64 / 2, height: 64 / 2)
                    
                // utilitarianSmall
                case (.utilitarianSmall, .small):
                    return CGSize(width: 40 / 2, height: 40 / 2)
                case (.utilitarianSmall, .medium):
                    return CGSize(width: 44 / 2, height: 44 / 2)
                case (.utilitarianSmall, .large):
                    return CGSize(width: 50 / 2, height: 50 / 2)
                    
                // utilitarianFlat
                case (.utilitarianSmallFlat, .small), (.utilitarianLarge, .small):
                    return CGSize(width: 18 / 2, height: 18 / 2)
                case (.utilitarianSmallFlat, .medium), (.utilitarianLarge, .medium):
                    return CGSize(width: 20 / 2, height: 20 / 2)
                case (.utilitarianSmallFlat, .large), (.utilitarianLarge, .large):
                    return CGSize(width: 22 / 2, height: 22 / 2)
                    
                default:
                    return nil
            }
        }
        
        func text(for action: GuessData.QuickAction) -> (text: String, shortText: String)? {
            var text: String
            var shortText: String
            
            switch action {
                case .letMeGuess:
                    text = NSLocalizedString("Let Me Guess", comment: "")
                    shortText = NSLocalizedString("Guess", comment: "")
                case .letAiGuess:
                    text = NSLocalizedString("Let AI Guess", comment: "")
                    shortText = NSLocalizedString("Guess", comment: "")
                case .randomizer:
                    text = NSLocalizedString("Randomizer", comment: "")
                    shortText = NSLocalizedString("Random", comment: "")
                case .randomNumber:
                    text = NSLocalizedString("Random Number", comment: "")
                    shortText = NSLocalizedString("Number", comment: "")
                case .randomColor:
                    text = NSLocalizedString("Random Color", comment: "")
                    shortText = NSLocalizedString("Color", comment: "")
                case .randomBoolean:
                    text = NSLocalizedString("Random Boolean", comment: "")
                    shortText = NSLocalizedString("Boolean", comment: "")
                default:
                    return nil
            }
            
            return (text, shortText)
        }
        
        if #available(watchOSApplicationExtension 7.0, *) {
            var image: UIImage? = nil
            var textProvider: CLKSimpleTextProvider? = nil
            
            if let action = GuessData.QuickAction.init(rawValue: complication.identifier), action != .none {
                if let size = symbolSize(for: complication.family) {
                    image = symbol(for: action)?.resized(to: size, scaleMode: .fit, autoScaleForGraphicComplication: true)?.applyingTint(.white)
                }
                if let texts = text(for: action) {
                    textProvider = CLKSimpleTextProvider(text: texts.text, shortText: texts.shortText)
                }
            }
            
            return template(for: complication.family, withImage: image, withTextProvider: textProvider)
        } else {
            return template(for: complication.family)
        }
    }
    
    // MARK: - Multiple Complication Support
    
    @available(watchOSApplicationExtension 7.0, *)
    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let families: [CLKComplicationFamily] = [.circularSmall, .extraLarge, .graphicBezel, .graphicCircular, .graphicCorner, .modularSmall, .utilitarianSmall, .utilitarianSmallFlat, .utilitarianLarge]
        let launchAppDescriptor = CLKComplicationDescriptor(identifier: "None", displayName: NSLocalizedString("Open App", comment: ""), supportedFamilies: families)
        let newUserGuessingDescriptor = CLKComplicationDescriptor(identifier: "Let Me Guess", displayName: NSLocalizedString("Let Me Guess", comment: ""), supportedFamilies: families)
        let newAiGuessingDescriptor = CLKComplicationDescriptor(identifier: "Let AI Guess", displayName: NSLocalizedString("Let AI Guess", comment: ""), supportedFamilies: families)
        let randomizerDescriptor = CLKComplicationDescriptor(identifier: "Randomizer", displayName: NSLocalizedString("Randomizer", comment: ""), supportedFamilies: families)
        let randomizeNumberDescriptor = CLKComplicationDescriptor(identifier: "Random Number", displayName: NSLocalizedString("Random Number", comment: ""), supportedFamilies: families)
        let randomizeColorDescriptor = CLKComplicationDescriptor(identifier: "Random Color", displayName: NSLocalizedString("Random Color", comment: ""), supportedFamilies: families)
        let randomizeBooleanDescriptor = CLKComplicationDescriptor(identifier: "Random Boolean", displayName: NSLocalizedString("Random Boolean", comment: ""), supportedFamilies: families)
        
        handler([launchAppDescriptor, newUserGuessingDescriptor, newAiGuessingDescriptor, randomizerDescriptor, randomizeNumberDescriptor, randomizeColorDescriptor, randomizeBooleanDescriptor])
    }
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(.distantPast)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(.distantFuture)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        if let template = complicationTemplate(for: complication) {
            handler(CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template))
        } else {
            handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        if let template = complicationTemplate(for: complication) {
            handler([CLKComplicationTimelineEntry(date: .distantPast, complicationTemplate: template), CLKComplicationTimelineEntry(date: date - 1, complicationTemplate: template)])
        } else {
            handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        if let template = complicationTemplate(for: complication) {
            handler([CLKComplicationTimelineEntry(date: date + 1, complicationTemplate: template), CLKComplicationTimelineEntry(date: .distantFuture, complicationTemplate: template)])
        } else {
            handler(nil)
        }
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(complicationTemplate(for: complication))
    }
    
}
