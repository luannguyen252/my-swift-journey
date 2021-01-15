import SwiftUI

class Profile{
    var name: String = ""
    var subtitle: String = ""
    var companyName: String = ""
    var description: String = ""
    var profilePic: String = ""
    
    init(name: String, subtitle: String, companyName: String, description: String, profilePic: String) {
        self.name = name
        self.subtitle = subtitle
        self.companyName = companyName
        self.description = description
        self.profilePic = profilePic
    }
}

struct ProfileView: View {
    var profile: Profile = Profile(name: "Keerthi Velusamy", subtitle: "Senior iOS Developer", companyName: "Sparkout Tech Solutions", description: "SwiftUI - Better Apps. Less Code", profilePic: "profilepic")
    
    let imageWidth = UIScreen.main.bounds.width * 0.5
    
    var profileButton: some View {
        Button(action: {  }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Group {
                    Image(profile.profilePic)
                        .frame(width:imageWidth, height: imageWidth, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 10))
                    Text(profile.name)
                        .font(.title)
                        .foregroundColor(Color.pink)
                    Text(profile.companyName)
                        .font(.title)
                    Text(profile.subtitle)
                        .font(.headline)
                    Text(profile.description)
                        .font(.body)
                    Divider()
                }
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
