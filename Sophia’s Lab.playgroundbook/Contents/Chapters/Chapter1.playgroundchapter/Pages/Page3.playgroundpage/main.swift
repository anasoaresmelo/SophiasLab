//#-hidden-code
import SwiftUI
import PlaygroundSupport

struct ThankYouView: View {
    
    let sophiaProfileImage = UIImage(named: "SOPHIAPROFILE.png")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack{
                Text("We can do it 💪🏾")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: Color(.systemIndigo), radius: 25)
                
                HStack {
                    VStack {
                        Image(uiImage: sophiaProfileImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/1.5, alignment: .center)
                            .padding(50)
                    }
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ThankYouView())
//#-end-hidden-code
/*:
 # 🧐 But why is this methid so important?
 
 First of all, the Crispr/Cas9 method made gene editing **cheaper** and **easier**. Before, something that would take years and cost thousands of dollars, now it can be developed in months and can cost a hundred times less.
 
And it has contributed to many important discoveries and researches:
 
    - Disruption of the cell cycle and destruction of cancer cells;
 
    - Self-destruction of superbugs;
 
    - Improvement of agricultural species;
 
    - Reduced fertility in disease-transmitting mosquitoes;
 
    - Creation of  efficient metabolic pathways for Sustainable and cost-effective biofuels;
 
    - And last but certainly not least, the development of a new type of vaccine. Something crucial in the COVID-19 pandemic since these vaccines were able to count on the speed that the method provides.
 
 *  *  *  *  *  *  *  *  *  *  *  *
 #  👋 Farewell
 
 **Wow!** Do you see how many fantastic possibilities have emerged with the research of these women?! I want to be like them when I grow up! In fact, **I will be**. 😎
 
 That's it, I hope you enjoyed our journey today. See ya! 👋🏾
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 # 💬 A mensage from Emmanuelle
 
 ![Quote from Emmanuelle Charpentier](QuoteEmmanuelle.png)
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 [👈 Previous page](@previous)  ||  [Next page 👉](@next)
 */
