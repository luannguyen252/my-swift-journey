FORMATTER_OPTIONS = --swiftversion 5.2 --stripunusedargs unnamed-only --self insert --disable blankLinesAtStartOfScope,blankLinesAtEndOfScope --ifdef no-indent

format:
	swiftformat --header "// SwiftUIPlayground\n// https://github.com/ralfebert/SwiftUIPlayground/" $(FORMATTER_OPTIONS) --exclude SwiftUIPlayground/AppleSwiftUITutorials SwiftUIPlayground*
	swiftformat $(FORMATTER_OPTIONS) SwiftUIPlayground/AppleSwiftUITutorials
