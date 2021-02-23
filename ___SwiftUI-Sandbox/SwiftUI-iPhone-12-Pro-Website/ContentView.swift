//
//  Apple.swift
//  Playground
//
//  Created by Navdeep Singh on 7/14/20.
//

import SwiftUI

struct Apple: View {
    var body: some View {
        ScrollView(.vertical) {
            AddressBar()
            Navbar()
            TitleBar()
            AppleCard()
            Display()
            Model()
            Charger()
            Footer().edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Footer: View {
    var body: some View {
        HStack {
            Button(action:{}){
                Text("Continue").foregroundColor(.white)
            }.frame(width: 300, height: 35).background(Color("button")).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20).cornerRadius(8)
            Image(systemName: "heart").foregroundColor(.secondary)
        }
    }
}

struct Charger: View {
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 12) {
                Text("Do you need a charger in box?").font(.headline).fontWeight(.bold)
                Text("iPhone 12 models will not include a power adapter in the box. You can order a 20W USB-C Charger separately or use your existing one.").font(.footnote).foregroundColor(.secondary).padding(.bottom, 8)
                VStack (spacing: 12) {
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Text("No").font(.headline)
                            VStack {
                                Text("Receive $25 Apple Gift Card").multilineTextAlignment(.center)
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Text("Yes").font(.headline)
                            VStack {
                                Text("20W USB-C")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                }
            }.padding()
            
            Divider().padding(.all, 12)
        }
    }
}

struct Model: View {
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 12) {
                Text("Choose your model.").font(.headline).fontWeight(.bold)
                VStack {
                    HStack {
                        VStack (alignment: .leading, spacing: 4)  {
                            Text("iPhone 12 Pro").font(.headline).fontWeight(.bold)
                            Text("5.8-inch display").font(.footnote).foregroundColor(.secondary)
                        }
                        Spacer()
                        VStack (alignment: .trailing) {
                            Text("From $41.62/mo.*")
                            Text("or $999")
                        }
                    }
                }.padding(.vertical, 20).padding(.horizontal, 5).border(Color.secondary.opacity(0.4), width: 0.6 )
                VStack {
                    HStack {
                        VStack (alignment: .leading, spacing: 4) {
                            Text("iPhone 12 Pro Max").font(.headline).fontWeight(.bold)
                            Text("6.5-inch display").font(.footnote).foregroundColor(.secondary)
                        }
                        Spacer()
                        VStack (alignment: .trailing) {
                            Text("From $45.79/mo.*")
                            Text("or $1099")
                        }
                    }
                }.padding(.vertical, 20).padding(.horizontal, 5).border(Color.secondary.opacity(0.4), width: 0.6 )
            }.padding()
            
            Divider().padding(.all, 12)
            
            VStack (alignment: .leading, spacing: 12) {
                Text("Choose your finish.").font(.headline).fontWeight(.bold)
                VStack {
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Circle().frame(width: 30, height: 30).foregroundColor(Color("gray"))
                            Text("Space Gray").font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Circle().frame(width: 30, height: 30).foregroundColor(Color("silver"))
                            Text("Silver").font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Circle().frame(width: 30, height: 30).foregroundColor(Color("green"))
                            Text("Midnight Green").font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Circle().frame(width: 30, height: 30).foregroundColor(Color("gold"))
                            Text("Gold").font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                }
            }.padding()
            
            Divider().padding(.all, 12)
            
            VStack (alignment: .leading, spacing: 12) {
                Text("Choose your capacity.").font(.headline).fontWeight(.bold)
                VStack (spacing: 12) {
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            HStack (spacing: 4) {
                                Text("128").font(.title)
                                Text("GB").font(.subheadline).offset(y: 5)
                            }
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            HStack (spacing: 4) {
                                Text("256").font(.title)
                                Text("GB").font(.subheadline).offset(y: 5)
                            }
                            VStack {
                                Text("From $47.87/mo.*")
                                Text("or $1149")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            HStack (spacing: 4) {
                                Text("512").font(.title)
                                Text("GB").font(.subheadline).offset(y: 5)
                            }
                            VStack {
                                Text("From $56.20/mo.*")
                                Text("or $1349")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        Spacer()
                    }
                }
            }.padding()
            
            Divider().padding(.all, 12)
            
            VStack (alignment: .leading, spacing: 12) {
                Text("Choose your carrier.").font(.headline).fontWeight(.bold)
                Text("We'll work with your current carrier to activate your new iPhone so you can keep your existing number and rate plan").font(.footnote).foregroundColor(.secondary).padding(.bottom, 8)
                VStack (spacing: 12) {
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Text("AT&T").bold()
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Text("Sprint").bold()
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Text("T-Mobile").bold()
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Text("Verizon").bold()
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Text("SIM-Free - activate with any").bold()
                            Text("carrier later.").bold()
                            VStack {
                                Text("From $41.62/mo.*")
                                Text("or $999")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 352, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                }
                
                Text("Will my new iPhone be unlocked?").foregroundColor(.blue).font(.caption).padding(.top, 12)
            }.padding()
            
            Divider().padding(.all, 12)
            
            VStack (alignment: .leading, spacing: 12) {
                Text("Do you have a smartphone to trade in?").font(.headline).fontWeight(.bold)
                Text("See how Apple Trade In works").font(.footnote).foregroundColor(.blue).padding(.bottom, 8)
                VStack (spacing: 12) {
                    HStack (spacing: 12) {
                        VStack (spacing: 4) {
                            Text("No").font(.headline)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                        VStack (spacing: 4) {
                            Text("Yes").font(.headline)
                            VStack {
                                Text("Up to $280 off*")
                            }.font(.footnote).foregroundColor(.secondary)
                        }.frame(width: 170, height: 100).border(Color.secondary.opacity(0.4), width: 0.6)
                    }
                }
            }.padding()
            
            Divider().padding(.all, 12)
        }
    }
}

struct Display: View {
    var body: some View {
        VStack {
            VStack (spacing: 4) {
                Text("Buy iPhone 12 Pro").font(.title).fontWeight(.bold).padding(.top, 8).padding(.bottom, 4)
                Text("Get up to $280 off with trade-in*")
                Text("See how Apple Trade In works").font(.caption).foregroundColor(.blue)
            }
            Image("iphone").resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.width, height: 500)
            HStack {
                Image(systemName: "bubble.left.and.bubble.right").foregroundColor(.blue)
                Text("Chat with an iPhone Specialist").foregroundColor(.blue).font(.caption)
            }
        }
    }
}


struct AppleCard: View {
    var body: some View {
        VStack {
            Text("Pay for your new iPhone over 24 months at 0% APR with Apple Card. Just select Apple Card Monthly Installments and continue to apple").font(.footnote).multilineTextAlignment(.center).foregroundColor(.secondary)
            HStack {
                Text("Learn more").font(.footnote)
                Image(systemName: "chevron.right").font(.footnote)
            }.foregroundColor(.blue)
        }.padding().background(Color.gray.opacity(0.06))
    }
}

struct TitleBar: View {
    var body: some View {
        VStack {
            HStack {
                Text("iPhone 12 Pro").font(.headline).fontWeight(.bold)
                Spacer()
                Text("From $41.62/mo.* or $999").font(.subheadline)
            }.padding()
        }
    }
}

struct AddressBar: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "textformat.size")
                Spacer()
                Image(systemName: "lock.fill")
                Text("apple.com")
                Spacer()
                Image(systemName: "arrow.clockwise")
            }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)).frame(width: 350).foregroundColor(.primary).background(Color.gray.opacity(0.1)).cornerRadius(12).padding(.horizontal)
        }
    }
}

struct Navbar: View {
    var body: some View {
        HStack {
            Image(systemName:"xmark")
            Spacer()
            Image(systemName: "applelogo")
            Spacer()
            Image(systemName: "bag")
        }.padding().background(Color("navbar")).foregroundColor(Color.white.opacity(0.8))
    }
}

struct Apple_Previews: PreviewProvider {
    static var previews: some View {
        Apple()
    }
}
