//#-hidden-code
import SwiftUI
import PlaygroundSupport

struct ScientistsView: View {
    
    @State private var emmanuelleIsPresented = false
    @State private var jenniferIsPresented = false
    let emmanuelleProfileImage = UIImage(named: "EMMANUELLEPROFILE.png")
    let jenniferProfileImage = UIImage(named: "JENNIFERPROFILE.png")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack{
                Text("Let's meet them!")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: Color(.systemIndigo), radius: 25)
                
                HStack {
                    VStack {
                        Image(uiImage: emmanuelleProfileImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/2.5, alignment: .center)
                            .padding(50)
                        
                        Text("Emmanuelle \n Charpentier")
                            .foregroundColor(Color(.systemIndigo).opacity(0.9))
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 150, alignment: .center)
                                    .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                            )
                    }
                    .onTapGesture {
                        emmanuelleIsPresented.toggle()
                    }.fullScreenCover(isPresented: $emmanuelleIsPresented, content: EmmanuelleView.init)
                    
                    VStack {
                        Image(uiImage: jenniferProfileImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/2.5, alignment: .center)
                            .padding(50)
                        
                        Text("Jennifer A.\nDoudna")
                            .foregroundColor(Color(.systemIndigo).opacity(0.9))
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 150, alignment: .center)
                                    .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                            )
                    }
                    .onTapGesture {
                        jenniferIsPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $jenniferIsPresented, content: JenniferView.init)
                }
            }
        }
    }
}

struct EmmanuelleView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    let emmanuelleImage = UIImage(named: "EMMANUELLE.png")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack {
                HStack {
                    Image(uiImage: emmanuelleImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/1.5, alignment: .center)
                        
                    VStack {
                        Text("Emmanuelle Charpentier")
                            .foregroundColor(Color(.systemIndigo).opacity(0.9))
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .padding(.top, 40)
                            .padding(.horizontal, 20)
                        
                        Text("She's a French professor and researcher in microbiology, genetics, and biochemistry.\n \nHer PhD project investigated molecular mechanisms involved in antibiotic resistance.\n \nIn 2013, Charpentier co-founded CRISPR Therapeutics, a company that employed CRISPR methodology for gene therapy in humans")
                            .foregroundColor(Color(.systemIndigo))
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .frame(minWidth: 350)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                            
                    }
                    .background (
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.white)
                                .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                        )
                    }.padding(.trailing, 150)
                .padding(.bottom, 50)
                Button("Go back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(Color(.systemIndigo).opacity(0.9))
                .padding(.vertical, 30)
                .padding(.horizontal, 50)
                .background(Color.white)
                .cornerRadius(20)
                }
        }
    }
}

struct JenniferView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    let jenniferImage = UIImage(named: "JENNIFER.png")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack {
                HStack {
                    Image(uiImage: jenniferImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/1.5, alignment: .center)
                    
                    VStack {
                        Text("Jennifer Anne \nDoudna")
                            .foregroundColor(Color(.systemIndigo).opacity(0.9))
                            .font(.system(size: 35, weight: .bold, design: .default))
                            .padding(.top, 40)
                            .padding(.horizontal, 20)
                        
                        Text("She's  is an American professor and researcher in biochemistry. \n \n Early in her career Doudna worked to deduce the three-dimensional structures of RNA molecules, which provided insight on RNA catalytic activity.\n \nShe later investigated the control of genetic information by certain small RNAs and became interested in CRISPR.")
                            .foregroundColor(Color(.systemIndigo))
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .frame(minWidth: 350)
                            .padding(.vertical, 40)
                            .padding(.horizontal, 30)
                        
                    }
                    .background (
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                            .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                    )
                }
                .padding(.trailing, 150)
                .padding(.bottom, 100)
                Button("Go back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(Color(.systemIndigo).opacity(0.9))
                .padding(.vertical, 30)
                .padding(.horizontal, 50)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ScientistsView())

//#-end-hidden-code
/*:
 ## ✨ Meet Sophia
 ![Hi, my name is Sophia!](SophiaSaysHi.png)
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 ### 👩‍🔬 Women in science
 
 I found a report From **UNESCO** and there's a graphic that represents the percentage of both genders by field of study worldwide, and among the girls student in higher education, only around **30%** choose **STEM-related** ones.
 
 But that didn't make me sad or stop chasing my dreams, only make me wanted to **change this scenario** even more. 😌
 
 So I started looking for women who contributed to science. I discovered that, *although we are still a minority and often wronged by the academy*, we have many stories of revolutionary discoveries and inventions made by women in the most diverse fields of study: mathematics, computing, chemistry, biology, etc.
 
 As was the case with physicist Chien-Shiung Wu: She became famous for the “Wu Experiment”, which overturned the theory of parity in physics. This discovery led to a *Nobel Prize that was awarded to the male scientists who worked with she*, although Wu was a central figure in these studies.
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 ### 🏆 Nobel 2020
 
 Happily, the Nobel Prize in Chemistry 2020 was awarded jointly to **Emmanuelle Charpentier** and **Jennifer A. Doudna** "for the development of a method for genome editing."
 
 What was a **very symbolic achievement for all women scientists**, given that in a pandemic year - in which we need to isolate ourselves at home - the double journey of women was a burden that can be observed in the drop in the number of scientific articles produced by them.
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 * Experiment:
 Let's know a little more about these inspiring women: tap or double click on the illustrations to read more.

 *  *  *  *  *  *  *  *  *  *  *  *
 
[Next page 👉](@next)
 */
