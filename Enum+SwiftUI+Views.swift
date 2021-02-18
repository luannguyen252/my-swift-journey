enum SFSymbol: String, View {
  case close = "xmark"
  case share = "square.and.arrow.up"

  var body: Image {
    Image(systemName: rawValue)
  }
}