import SwiftUI

struct GroceryShopView: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {

        // MARK: Search Bar
        HStack{
          Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
            .padding(.horizontal, 18)

          TextField("Find food here...", text: .constant(""))
            .keyboardType(.webSearch)
        }
        .frame(minHeight: 60)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.15))
        )
        .padding(.top)
        .padding(.horizontal, 32)

        // MARK: Ingredients Header
        GroceryHeader(title: "Ingredients", onClick: {})
          .padding(.horizontal, 32)

        // MARK: Ingredients
        LazyVGrid(
          columns: [
            GridItem(.flexible(minimum: 40, maximum: 80)),
            GridItem(.flexible(minimum: 40, maximum: 80)),
            GridItem(.flexible(minimum: 40, maximum: 80)),
            GridItem(.flexible(minimum: 40, maximum: 80))
          ],
          spacing: 18
        ) {
          ForEach(GroceryIngredient.ingredients) { ingredient in
            VStack {
              ZStack {
                Image(ingredient.image)
              }
              .frame(width: 40, height: 40)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.gray.opacity(0.25), style: StrokeStyle())
              )

              Text(ingredient.name)
                .lineLimit(1)
            }
          }
        }
        .padding(.horizontal, 32)

        // MARK: Slider
        ScrollView(.horizontal, showsIndicators: false){
          HStack(spacing: 16) {
            Spacer(minLength: 16)

            ForEach(GrocerySliderItem.items) { item in
              ZStack(alignment: .bottomLeading) {
                Image(item.image)
                  .resizable()
                  .aspectRatio(16/7, contentMode: .fill)
                  .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading) {
                  Text(item.title)
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding(.bottom, 3)

                  Text(item.subTitle)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                }
                .padding(.all, 25)
              }
              .aspectRatio(16/7, contentMode: .fill)
              .frame(width: UIScreen.main.bounds.width - 80)
              .padding(.vertical)
              .shadow(radius: 7)
            }

            Spacer(minLength: 16)
          }
        }

        // MARK: Menu Header
        GroceryHeader(title: "Top Rated Recipe", onClick: {})
          .padding(.horizontal, 32)

        // MARK: Menu
        LazyVGrid(
          columns: [
            GridItem(.adaptive(minimum: 120, maximum: 200), spacing: 18)
          ],
          spacing: 32
        ){
          ForEach(GroceryItem.items){ item in
            GroceryItemView(groceryItem: item)
          }
        }
        .padding(.horizontal, 32)

      }
    }
    //.navigationBarTitle(Text("Home"))
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(
      leading: Button(action: {}) {
        Image("ic_menu")
          .foregroundColor(.black)
          .padding(.leading)
      },
      trailing: Button(action: {}) {
        Image("ic_notification")
          .foregroundColor(.black)
          .padding(.trailing)
      }
    )
    .navigationBarColor(.white)
  }
}

struct GroceryShopView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GroceryShopView()
    }
    .preferredColorScheme(.light)
  }
}
