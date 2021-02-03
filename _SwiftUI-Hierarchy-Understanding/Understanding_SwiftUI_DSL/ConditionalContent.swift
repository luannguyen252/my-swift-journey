import SwiftUI

struct ConditionalContent_If_standard: View {
    var showHand = true

    var body: some View {
        VStack {
            Text("Hello")
            Text("world!").bold()
            
            if showHand { Text("👋") }
        }
    }
}

struct ConditionalContent_If_article: View {
    var showHand = true
    
    var body: VStack<TupleView<(Text, Text, Optional<Text>)>> {
        let helloText: Text = Text("Hello")
        let worldText: Text = Text("world!").bold()
        let optionalHandText: Optional<Text> = showHand ? .some(Text("👋")) : .none
        let tupleView = TupleView((helloText, worldText, optionalHandText))
        return VStack(content: { return tupleView })
    }
}

struct ConditionalContent_If_else_standard: View {
    var useImage = true
    
    var body: some View {
        VStack {
            Text("Hello")
            
            if useImage {
                Image(systemName: "globe")
            } else {
                Text("world!").bold()
            }
        }
    }
}

struct ConditionalContent_If_else_article: View {
    var useImage = true
        
    var body: VStack<TupleView<(Text, _ConditionalContent<Text, Image>)>> {
        // Views
        let helloText: Text = Text("Hello")
        let worldText: Text = Text("world!").bold()
        let worldImage: Image = Image(systemName: "globe")
       
        // Create content for each branch
        let trueContent: _ConditionalContent<Text, Image> = ViewBuilder.buildEither(first: worldText)
        // ConditionalContent<Text, Image>(storage: .trueContent(worldText))
       
        let falseContent: _ConditionalContent<Text, Image> = ViewBuilder.buildEither(second: worldImage)
        // Equivalent to _ConditionalContent<Text, Image>(storage: .falseContent(worldImage))
       
        // Pick either conditional content at runtime (with a static type designating both).
        let worldTextOrWorldImage: _ConditionalContent<Text, Image> = useImage ? trueContent : falseContent
       
        // Tuple and Vertical Stack
        let tupleView = TupleView((helloText, worldTextOrWorldImage))
        return VStack(content: { return tupleView })
    }
}

enum `Type`: String, CaseIterable { case text, image, color, divider, spacer }

struct ConditionalContent_Switch_standard: View {
    var type: `Type` = .image
    
    var body: some View {
        Group {
            switch type {
            case .text:
                Text("Text")
            case .image:
                Image(systemName: "photo")
            case .color:
                Color.red
            case .divider:
                Divider()
            case .spacer:
                Spacer()
            }
        }
    }
}

typealias SwitchGroupType = Group<
    _ConditionalContent<
        _ConditionalContent<
            _ConditionalContent<Text, Image>,
            _ConditionalContent<Color, Divider>
        >,
        Spacer
    >
>

struct ConditionalContent_Switch_Switch_standard: View {
    var type: `Type` = .image
    
    var body: some View {
        let group: Group<_ConditionalContent<_ConditionalContent<_ConditionalContent<Text, Image>, _ConditionalContent<Color, Divider>>, Spacer>> =
            Group {
                switch type {
                case .text:
                    Text("Text")
                case .image:
                    Image(systemName: "photo")
                case .color:
                    Color.red
                case .divider:
                    Divider()
                case .spacer:
                    Spacer()
                }
            }
        
        return group
    }
}

struct ConditionalContent_Switch_If_else_standard: View {
    var type: `Type` = .image
    
    var body: some View {
        let group: SwitchGroupType =
            Group {
                if type == .text {
                    Text("Text")
                } else if type == .image {
                    Image(systemName: "photo")
                } else if type == .color {
                    Color.red
                } else if type == .divider {
                    Divider()
                } else { // if type == .spacer
                    Spacer()
                }
            }
        
        return group
    }
}

struct ConditionalContent_Switch_dissected_1: View {
    var type: `Type` = .image
    
    var body: some View {
        let textOrImage: _ConditionalContent<Text, Image> =
            type == .text
                ? ViewBuilder.buildEither(first: Text("Text"))
                : ViewBuilder.buildEither(second: Image(systemName: "photo"))
        
        let colorOrDivider: _ConditionalContent<Color, Divider> =
            type == .color
                ? ViewBuilder.buildEither(first: Color.red)
                : ViewBuilder.buildEither(second: Divider())
                
        let textOrImageOrColorOrDivider: _ConditionalContent<_ConditionalContent<Text, Image>, _ConditionalContent<Color, Divider>> =
            type == .text || type == .image
                ? ViewBuilder.buildEither(first: textOrImage)
                : ViewBuilder.buildEither(second: colorOrDivider)
        
        let textOrImageOrColorOrDividerOrSpacer: _ConditionalContent<_ConditionalContent<_ConditionalContent<Text, Image>, _ConditionalContent<Color, Divider>>, Spacer> =
            type == .text || type == .image || type == .color || type == .divider
                ? ViewBuilder.buildEither(first: textOrImageOrColorOrDivider)
                : ViewBuilder.buildEither(second: Spacer())
        
        let group: SwitchGroupType = Group(content: { return textOrImageOrColorOrDividerOrSpacer })
        return group
    }
}

struct ConditionalContent_Switch_dissected_2: View {
    var type: `Type` = .image
    
    var body: some View {
        let group: SwitchGroupType =
            Group(content: {
                return type == .text || type == .image || type == .color || type == .divider
                    ? ViewBuilder.buildEither(
                        first:
                        (
                            type == .text || type == .image
                                ? ViewBuilder.buildEither(
                                    first:
                                    (
                                        type == .text
                                            ? ViewBuilder.buildEither(first: Text("Text"))
                                            : ViewBuilder.buildEither(second: Image(systemName: "photo"))
                                    )
                                )
                                : ViewBuilder.buildEither(
                                    second:
                                    (
                                        type == .color
                                            ? ViewBuilder.buildEither(first: Color.red)
                                            : ViewBuilder.buildEither(second: Divider())
                                    )
                                )
                        )
                    )
                    : ViewBuilder.buildEither(
                        second: Spacer()
                    )
            })
        
        return group
    }
}

struct ConditionalContent_Switch_dissected_3: View {
    var type: `Type` = .image
        
    var body: Group<
        _ConditionalContent<
            _ConditionalContent<
                _ConditionalContent<Text, Image>,
                _ConditionalContent<Color, Divider>
            >,
            Spacer
        >
    > {
        return Group(content: {
            switch type {
            case .text:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        first: ViewBuilder.buildEither(
                            first: Text("Text")
                        )
                    )
                )
            case .image:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        first: ViewBuilder.buildEither(
                            second: Image(systemName: "photo")
                        )
                    )
                )
            case .color:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        second: ViewBuilder.buildEither(
                            first: Color.red
                        )
                    )
                )
            case .divider:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        second: ViewBuilder.buildEither(
                            second: Divider()
                        )
                    )
                )
            case .spacer:
                return ViewBuilder.buildEither(
                    second: Spacer()
                )
            }
        })
    }
}

#if _CONDITIONAL_CONTENT_WERE_PUBLIC
struct ConditionalContent_Switch_dissected_4: View {
    var type: `Type` = .image
        
    var body: Group<
        _ConditionalContent<
            _ConditionalContent<
                _ConditionalContent<Text, Image>,
                _ConditionalContent<Color, Divider>
            >,
            Spacer
        >
    > {
        return Group(content: {
            switch type {
            case .text:
                return
                    _ConditionalContent(storage: .trueContent(
                        _ConditionalContent(storage: .trueContent(
                            _ConditionalContent(storage: .trueContent(
                                Text("Text")
                            ))
                        ))
                    ))
            case .image:
                return
                    _ConditionalContent(storage: .trueContent(
                        _ConditionalContent(storage: .trueContent(
                            _ConditionalContent(storage: .falseContent(
                                Image(systemName: "photo")
                            ))
                        ))
                    ))
            case .color:
                return
                    _ConditionalContent(storage: .trueContent(
                        _ConditionalContent(storage: .falseContent(
                            _ConditionalContent(storage: .trueContent(
                                Color.red
                            ))
                        ))
                    ))
            case .divider:
                return _ConditionalContent(storage: .trueContent(
                        _ConditionalContent(storage: .falseContent(
                            _ConditionalContent(storage: .falseContent(
                                Divider()
                            ))
                        ))
                    ))
            case .spacer:
                return _ConditionalContent(storage: .falseContent(
                    Spacer()
                ))
            }
        })
    }
}
#endif

struct ConditionalContent_Switch_interactive: View {
    @State var type: `Type` = .image
    
    var typePicker: some View {
        Picker("Type", selection: $type) {
            ForEach(`Type`.allCases, id: \.self) { eachType in Text(eachType.rawValue.capitalized) }
        }
            .pickerStyle(SegmentedPickerStyle())
    }
    
    var body: some View {
        let textOrImage: _ConditionalContent<Text, Image> =
            type == .text
                ? ViewBuilder.buildEither(first: Text("Text"))
                : ViewBuilder.buildEither(second: Image(systemName: "photo"))
        
        let colorOrDivider: _ConditionalContent<Color, Divider> =
            type == .color
                ? ViewBuilder.buildEither(first: Color.red)
                : ViewBuilder.buildEither(second: Divider())
                
        let textOrImageOrColorOrDivider: _ConditionalContent<_ConditionalContent<Text, Image>, _ConditionalContent<Color, Divider>> =
            type == .text || type == .image
                ? ViewBuilder.buildEither(first: textOrImage)
                : ViewBuilder.buildEither(second: colorOrDivider)
        
        let textOrImageOrColorOrDividerOrSpacer: _ConditionalContent<_ConditionalContent<_ConditionalContent<Text, Image>, _ConditionalContent<Color, Divider>>, Spacer> =
            type == .text || type == .image || type == .color || type == .divider
                ? ViewBuilder.buildEither(first: textOrImageOrColorOrDivider)
                : ViewBuilder.buildEither(second: Spacer())
        
        return VStack {
            typePicker
            textOrImageOrColorOrDividerOrSpacer
        }
    }
    
}

#if DEBUG
struct ConditionalContent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ConditionalContent_If_standard()
                .previewDisplayName("ConditionalContent_If_standard")
            
            ConditionalContent_If_article()
                .previewDisplayName("ConditionalContent_If_standard")
            
            ConditionalContent_If_else_standard()
                .previewDisplayName("ConditionalContent_If_else_standard")
            
            ConditionalContent_If_else_article()
                .previewDisplayName("ConditionalContent_If_else_article")
            
            ConditionalContent_Switch_standard()
                .previewDisplayName("ConditionalContent_Switch_standard")

            ConditionalContent_Switch_Switch_standard()
                .previewDisplayName("ConditionalContent_Switch_Switch_standard")
            
            ConditionalContent_Switch_If_else_standard()
                .previewDisplayName("ConditionalContent_Switch_If_else_standard")
            
            ConditionalContent_Switch_dissected_1()
                .previewDisplayName("ConditionalContent_Switch_dissected_1")
            
            ConditionalContent_Switch_dissected_2()
                .previewDisplayName("ConditionalContent_Switch_dissected_2")
            
            ConditionalContent_Switch_dissected_3()
                .previewDisplayName("ConditionalContent_Switch_dissected_3")
            
            // Wow, 11th child view! 😲
            ConditionalContent_Switch_interactive()
                .previewDisplayName("ConditionalContent_Switch_interactive")
        }
    }
}
#endif
