import SwiftUI

struct Level1View: View {
    @Binding var unlockedLevel: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var isLevelCompleted = false
    
    var body: some View {
        VStack {
            Text("Level 1")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                isLevelCompleted = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    unlockedLevel = 2
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Complete Level 1")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Level1View(unlockedLevel: .constant(1))
}
