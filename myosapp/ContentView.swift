import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date = Date()
    @State private var showDiary: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .accentColor(.pink) // ピンク色のアクセント
                    .onChange(of: selectedDate, perform: { value in
                        showDiary = true
                    })
                
                NavigationLink("", destination: DiaryView(date: selectedDate), isActive: $showDiary)
                    .hidden() // 非表示にする
            }
            .padding()
            .background(Color(red: 1.0, green: 0.9, blue: 0.9)) // ソフトピンクの背景
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
