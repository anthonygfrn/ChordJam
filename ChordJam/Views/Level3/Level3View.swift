import SwiftUI

struct Level3View: View {
    @Binding var unlockedLevel: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var isLevelCompleted = false
    
    var body: some View {
        VStack {
            Text("Level 3")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                isLevelCompleted = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    unlockedLevel = 4
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Complete Level 3")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Level3View(unlockedLevel: .constant(3))
}
