import SwiftUI

struct LayerModel: Equatable {
  let id = UUID().uuidString
}

struct BookDragView: BookView {

  var title: String {
    "Dragging View"
  }

  var summary: String {
    "A book "
  }

  @State private var currentPosition: CGSize = .zero
  @State private var newPosition: CGSize = .zero

  @State var selectedLayerID: String?
  @State var layers: [LayerModel] = []

  var body: some View {
    ZStack {

      Color.white.opacity(0.001) /** to enable hit testing*/

      VStack {

        Button(action: {
          addLayer()
        }, label: {
          Text("Add Layer")
        })

        ZStack {

          ForEach(layers, id: \.id) { layer in

            DraggableView(
              isSelected: layer.id == selectedLayerID,
              onSelected: {
                selectedLayerID = layer.id
              },
              content: { isSelected in
                ExpandableView(isSelected: isSelected) {
                  Components.MockView(name: "MyView")
                }
              })
              .fixedSize()
              .transition(AnyTransition.scale.animation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0)))

          }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
    .onTapGesture {
      UIApplication.shared.endEditing()
    }
  }

  private func addLayer() {
    withAnimation {
      layers.append(.init())
    }
  }

}

extension BookDragView {

  enum Components {

    struct MockView: View {

      let name: String

      init(name: String) {
        self.name = name
      }

      var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color(white: 0).opacity(0.1))
          .frame(
            minWidth: 0,
            idealWidth: nil,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: nil,
            maxHeight: .infinity,
            alignment: .center
          )
          .overlay(
            VStack {
              HStack {
                TextField("Name", text: .constant(name))
                  .font(.headline)
                  .foregroundColor(Color(white: 0.1))
                Spacer()
              }
              Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
          )
      }

    }

  }

  struct ExpandableView<Content: View>: View {

    private let content: Content

    @State private var modifiedFrame: CGSize? = CGSize(width: 100, height: 100)

    private let isSelected: Bool

    init(
      isSelected: Bool,
      @ViewBuilder content: () -> Content
    ) {
      self.isSelected = isSelected
      self.content = content()
    }

    var body: some View {
      content
        .frame(idealWidth: modifiedFrame?.width, idealHeight: modifiedFrame?.height)
        .padding(12)
        .overlay(
          GeometryReader { (arg: GeometryProxy) in
            ZStack {
              VStack {
                HorizontalHandleView { translationY in
                  updateSize(translateX: nil, translateY: translationY, containerSize: arg.size)
                }

                Spacer()

                HorizontalHandleView { translationY in
                  updateSize(translateX: nil, translateY: translationY * -1, containerSize: arg.size)
                }
              }
              .padding(.horizontal, 20)
              HStack {
                VerticalHandleView { translationX in
                  updateSize(translateX: translationX * -1, translateY: nil, containerSize: arg.size)
                }

                Spacer()

                VerticalHandleView { translationX in
                  updateSize(translateX: translationX, translateY: nil, containerSize: arg.size)
                }
              }
              .padding(.vertical, 20)
            }
          }
          .padding(4)
          .background(
            Color(white: 0.1)
              .opacity(0.1)
              .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
          )
          .opacity(isSelected ? 1 : 0)
        )
    }

    private func updateSize(translateX: CGFloat?, translateY: CGFloat?, containerSize: CGSize) {

      var size = modifiedFrame ?? containerSize

      translateX.map {
        size.width += $0
      }

      translateY.map {
        size.height += $0
      }

      modifiedFrame = size

    }

    private struct VerticalHandleView: View {

      @State private var currentValue: CGFloat = 0

      private let onTranslate: (CGFloat) -> Void

      init(onTranslate: @escaping (CGFloat) -> Void) {
        self.onTranslate = onTranslate
      }

      var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color(white: 0.5).opacity(0.5))
          .frame(width: 4)
          .gesture(
            DragGesture(minimumDistance: 0)
              .onChanged { value in
                let old = currentValue
                currentValue = value.translation.width
                onTranslate(currentValue - old)
              }
              .onEnded { value in
                let old = currentValue
                currentValue = value.translation.width
                onTranslate(currentValue - old)
                currentValue = 0
              }
          )
      }
    }

    private struct HorizontalHandleView: View {

      @State private var currentValue: CGFloat = 0

      private let onTranslate: (CGFloat) -> Void

      init(onTranslate: @escaping (CGFloat) -> Void) {
        self.onTranslate = onTranslate
      }

      var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color(white: 0.5).opacity(0.5))
          .frame(height: 4)
          .gesture(
            DragGesture(minimumDistance: 0)
              .onChanged { value in
                let old = currentValue
                currentValue = value.translation.height
                onTranslate(old - currentValue)
              }
              .onEnded { value in
                let old = currentValue
                currentValue = value.translation.height
                onTranslate(old - currentValue)
                currentValue = 0
              }
          )
      }
    }
  }

  struct DraggableView<Content: View>: View {

    @State private var currentPosition: CGPoint = .zero
    @State private var newPosition: CGPoint = .zero

    private let isSelected: Bool
    private let content: Content
    private let onSelected: () -> Void

    init(
      isSelected: Bool,
      onSelected: @escaping () -> Void,
      @ViewBuilder content: (Bool) -> Content
    ) {
      self.isSelected = isSelected
      self.onSelected = onSelected
      self.content = content(isSelected)
    }

    var body: some View {
      content
        .padding(4)
        .onHover { hovering in
          print(hovering)
        }
        .offset(x: currentPosition.x, y: currentPosition.y)
        .gesture(
          DragGesture(minimumDistance: 1)
            .onChanged { value in
              currentPosition = .init(
                x: value.translation.width + newPosition.x,
                y: value.translation.height + newPosition.y
              )
            }
            .onEnded { value in
              currentPosition = .init(
                x: value.translation.width + newPosition.x,
                y: value.translation.height + newPosition.y
              )
              newPosition = currentPosition
            }
        )
        .onTapGesture {
          onSelected()
        }
    }

  }
}

struct BookDragView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      BookDragView.Components.MockView(name: "MyView")

      BookDragView.ExpandableView(isSelected: true) {
        Text("aa")
          .padding(16)
          .background(Color.orange)
      }
    }
    .background(Color.white)
  }
}
