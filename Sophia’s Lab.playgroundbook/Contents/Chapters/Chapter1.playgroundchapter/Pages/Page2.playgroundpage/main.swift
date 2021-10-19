//#-hidden-code
import SwiftUI
import SpriteKit
import PlaygroundSupport

let dnaBaseImage = SKSpriteNode(imageNamed: "DNAStep1.png")
let dnaSmallerImage = SKSpriteNode(imageNamed: "DNAStep2.png")
let dnaNewSequenceImage = SKSpriteNode(imageNamed: "DNAStep3.png")

// MARK: Live View
struct ContentView: View {
    
    @State private var demoIsPresented = false
    @State private var gameIsPresented = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            
            VStack {
                Text("Demonstration")
                    .foregroundColor(Color(.systemIndigo).opacity(0.9))
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                            .frame(width: 400, height: 150, alignment: .center)
                            .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                    ).onTapGesture {
                        demoIsPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $demoIsPresented, content: DemoView.init)
                    .padding(150)
                
                Text("Play")
                    .foregroundColor(Color(.systemIndigo).opacity(0.9))
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                            .frame(width: 400, height: 150, alignment: .center)
                            .shadow(color: Color(.systemIndigo).opacity(0.5), radius: 25)
                    ).onTapGesture {
                        gameIsPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $gameIsPresented, content: GameView.init)
                
            }
            
        }
    }
}


// MARK: Game View and Scene
struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 800, height: 1000)
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.scaleMode = .fill
        scene.backgroundColor = #colorLiteral(red: 0.9844431281089783, green: 0.9844661355018616, blue: 0.9844536185264587, alpha: 1.0)
        return scene
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack{
                SpriteView(scene: scene)
                    .frame(width: 800, height: 1000)
                    .ignoresSafeArea()
                    .cornerRadius(20)
                
                Button("Go back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(Color(.systemIndigo).opacity(0.9))
                .padding(.vertical, 30)
                .padding(.horizontal, 50)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.top, 50)
            }
        }
    }
}

class GameScene: SKScene {
    
    private var currentNode: SKNode?
    private var feedback: SKNode?
    
    override func didMove(to view: SKView) {
        
        // DNA Base
        dnaBaseImage.position = CGPoint(x: 0, y: 0)
        dnaBaseImage.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        dnaBaseImage.size.width = size.width*0.15
        dnaBaseImage.size.height = size.height*0.6
        dnaBaseImage.zPosition = 1
        addChild(dnaBaseImage)
        
        // DNA Smaller Part
        dnaSmallerImage.position = CGPoint(x: 0, y: 100)
        dnaSmallerImage.size.width = size.width*0.15
        dnaSmallerImage.size.height = size.height*0.2
        dnaSmallerImage.zPosition = 2
        dnaSmallerImage.name = "draggable"
        addChild(dnaSmallerImage)
        
        // New Sequence
        dnaNewSequenceImage.position = CGPoint(x: -300, y: -200)
        dnaNewSequenceImage.size.width = size.width*0.15
        dnaNewSequenceImage.size.height = size.height*0.2
        dnaNewSequenceImage.zPosition = 3
        dnaNewSequenceImage.name = "draggable"
        addChild(dnaNewSequenceImage)
        
    }
    
    func presentFeedback() {
        if (dnaNewSequenceImage.position.x >= -5 && dnaNewSequenceImage.position.x <= 5 && dnaSmallerImage.position.x >= 150 || dnaSmallerImage.position.x <= -150){
            if (dnaNewSequenceImage.position.y >= 95 && dnaNewSequenceImage.position.y <= 105 && dnaSmallerImage.position.x >= 150 || dnaSmallerImage.position.x <= -150){
                let feedbackImage = SKSpriteNode(imageNamed: "Feedback.png")
                feedbackImage.position = CGPoint(x: 0, y: 0)
                feedbackImage.size.width = size.width*0.875
                feedbackImage.size.height = size.height*0.65
                feedbackImage.zPosition = 4
                addChild(feedbackImage)
                
                feedback = feedbackImage
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if node.name == "draggable" {
                    self.currentNode = node
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        presentFeedback()
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
}

// MARK: Demo View and Scene

// MARK: Game View and Scene
struct DemoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    
    var scene: SKScene {
        let scene = DemoScene()
        scene.size = CGSize(width: 800, height: 1000)
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene.scaleMode = .fill
        scene.backgroundColor = #colorLiteral(red: 0.9802958369255066, green: 0.9804596304893494, blue: 0.9802742600440979, alpha: 1.0)
        return scene
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemIndigo)]), startPoint: .topTrailing, endPoint: .leading)
            LinearGradient(gradient: Gradient(colors: [Color(.white).opacity(0.2), Color(.white).opacity(0.4)]), startPoint: .topTrailing, endPoint: .leading)
            VStack{
                SpriteView(scene: scene)
                    .frame(width: 800, height: 1000)
                    .ignoresSafeArea()
                    .cornerRadius(20)
                
                Button("Go back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(Color(.systemIndigo).opacity(0.9))
                .padding(.vertical, 30)
                .padding(.horizontal, 50)
                .background(Color.white)
                .cornerRadius(20)
                .padding(.top, 50)
            }
            
        }
    }
}

class DemoScene: SKScene {
    
    let moveRigth = SKAction.moveBy(x: 300, y: -100, duration:3.0)
    let stay = SKAction.moveBy(x: 0, y:0, duration:3.0)
    let moveCenter = SKAction.moveBy(x: 300, y: 300, duration:3.0)
    private var currentNode: SKNode?
    
    override func didMove(to view: SKView) {
        
        // DNA Base
        dnaBaseImage.position = CGPoint(x: 0, y: 0)
        dnaBaseImage.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        dnaBaseImage.size.width = size.width*0.15
        dnaBaseImage.size.height = size.height*0.6
        dnaBaseImage.zPosition = 1
        addChild(dnaBaseImage)
        
        // DNA Smaller Part
        dnaSmallerImage.position = CGPoint(x: 0, y: 100)
        dnaSmallerImage.size.width = size.width*0.15
        dnaSmallerImage.size.height = size.height*0.2
        dnaSmallerImage.zPosition = 2
        addChild(dnaSmallerImage)
        
        let reversedMoveRigth = moveRigth.reversed()
        let firstSequence = SKAction.sequence([moveRigth, stay, stay, reversedMoveRigth, stay])
        let firtsEndlessAction = SKAction.repeatForever(firstSequence)
        dnaSmallerImage.run(firtsEndlessAction)
        
        // New Sequence
        dnaNewSequenceImage.position = CGPoint(x: -300, y: -200)
        dnaNewSequenceImage.size.width = size.width*0.15
        dnaNewSequenceImage.size.height = size.height*0.2
        dnaNewSequenceImage.zPosition = 3
        addChild(dnaNewSequenceImage)
        let reversedMoveCenter = moveCenter.reversed()
        let secondSequence = SKAction.sequence([stay, moveCenter, stay, reversedMoveCenter, stay])
        let secondEndlessAction = SKAction.repeatForever(secondSequence)
        dnaNewSequenceImage.run(secondEndlessAction)
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
//#-end-hidden-code
/*:
 # 🧫 What is the CRISPR/CAS9 method?

 It is the most sophisticated **genetic editing technique** that currently exists.

**Emmanuelle Charpentier** discovered the **transactivator RNA** (tracrRNA) molecule while studying the *Streptococcus pyogenes* bacteria, which causes diseases such as pharyngitis and scarlet fever.

 This molecule was part of the **immune system of the bacterium**. The microbe has an unusual defense mechanism: *it incorporates the genetic material of viruses* that try to infect it to your own DNA. This creates a kind of "immunity" of bacteria, which in the future will remember those viruses.

 **Doudna** had already tried to use the CAS9 proteins, oriented by CRISPR, to cut pieces of DNA in the laboratory, but nothing happened. What was missing was the tracrRNA molecule discovered by Charpentier, needed to do intermediation between CRISPR and CAS9, *like a puzzle* piece to connect the two.
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 # 🦠 How it works?
 
 The CRISPR genetic structure, in the bacterial system, is made up of Clustered Regularly Interspaced Short Palindromic Repeats. The repeats and the spacers, when transcribed, form the **tracrRNA** (or guide RNA), which serves to **direct the Cas9 enzyme**, a nuclease, **to the target**.
 
 Taking advantage of this strategy, both the Cas9 protein and the guide RNA can be introduced in vitro into other cells and directed to specific places in the genome, for them to **cause breaks to the double strand**.
 
 After this splicing, the **intrinsic molecular machinery of the organism**, responsible for the correction of errors in the genome, is used to alter the DNA sequence, adopting the modification.
 
 The system can thus be used both to repair mutations (restoring genic function) and to introduce new mutations (causing the genic "knockout").
 *  *  *  *  *  *  *  *  *  *  *  *
 # 👾 Let's play!
  * Experiment:
 How about if we could reproduce this method?
 
    * Go to demonstration to see an animated version of what to do **OR** hit play
         1. The Cas9 protein and the tracrRNA already broke the double strand, search the draggable sequence 🔎
         2. Drag the DNA sequence that we separated to another place.
         3. Drag that other DNA sequence to our original DNA.

     Remeber that you cam alway go back and see the demonstration ☺️
 
 *  *  *  *  *  *  *  *  *  *  *  *
     
# 🏅 Voila! You made it!!
Of course in real life, it's a little harder, but wasn't exciting to visualize how it works?
 
 *  *  *  *  *  *  *  *  *  *  *  *
 
 [👈 Previous page](@previous)  ||  [Next page 👉](@next)
 */
