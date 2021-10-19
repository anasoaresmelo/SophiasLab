//#-hidden-code
import SwiftUI
import PlaygroundSupport

struct ThankYouView: View {
    
    let anaProfileImage = UIImage(named: "ANAPROFILE.png")
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack{
                Text("Thank you 💜")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .shadow(color: Color(.systemIndigo), radius: 25)
                
                HStack {
                    VStack {
                        Image(uiImage: anaProfileImage!)
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

 # 🌵 About the Author
 It’s a pleasure to meet you, I'm Ana Carolina, an undergraduate student in Biomedical Engineering at the Federal University of Pernambuco (UFPE).
 
 In 2020, I joined the Apple Developer Academy - UFPE and it was where I learned and fell in love with the world of iOS development. My goal is to develop high-tech solutions for the health field, and that's why the story I told you was so important and motivating for me.
 
 This was my first experience with SpriteKit and Swift Playgrounds, and I loved the idea to make a funny and meaningful content to the younger generation, I will definitely improve these skills.
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 # 📜 References
 For more information, please see
 
 * About Women in science
     * [Cracking the code: girls' and women's education in science, technology, engineering and mathematics (STEM)](https://unesdoc.unesco.org/ark:/48223/pf0000253479.locale=en)
     * [[PTBR] Trabalho de Chien-Shiung Wu foi essencial para ganhadores do Nobel](https://jornal.usp.br/atualidades/trabalho-de-chien-shiung-wu-foi-essencial-para-ganhadores-do-nobel/)
 
 * About the Nobel Prize in Chemistry and the winners
     * [Emmanuelle Charpentier](https://www.britannica.com/biography/Emmanuelle-Charpentier)
     * [Jennifer Doudna](https://www.britannica.com/biography/Jennifer-Doudna)
     * [Nobel Prize in Chemistry 2020 - Popular information](https://www.nobelprize.org/prizes/chemistry/2020/popular-information/)
     * [Two women share chemistry Nobel in historic win for 'genetic scissors'](https://www.bbc.com/news/science-environment-54432589)
     * [Dynamic Science Duo: 4 Things to Know About the Inspiring Women Who Just Won the 2020 Nobel Prize in Chemistry](https://www.jnj.com/latest-news/4-things-to-know-about-the-women-who-won-the-2020-nobel-prize-in-chemistry)
     
 * About CRISPR/Cas9 method
     * [CRISPR/Cas9: A powerful tool for crop genome editing](https://www.sciencedirect.com/science/article/pii/S2214514116000192)
     * [Genome modification by CRISPR/Cas9](https://febs.onlinelibrary.wiley.com/doi/full/10.1111/febs.13110)
     * [mRNA Technology Gave Us the First COVID-19 Vaccines. It Could Also Upend the Drug Industry](https://time.com/5927342/mrna-covid-vaccine/)
     * [The CRISPR/Cas9 System and the Possibility of Genomic Edition for Cardiology](https://www.scielo.br/scielo.php?script=sci_arttext&pid=S0066-782X2017000100081&lng=en&nrm=iso&tlng=en&ORIGINALLANG=en)
    * [Everything You Need to Know About CRISPR-Cas9](https://www.synthego.com/learn/crispr)
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 [👈 Previous page](@previous)
 */
