import SwiftUI

struct DiaryView: View {
    var date: Date
    @State private var diaryText: String = ""
    @Environment(\.presentationMode) var presentationMode 

    var body: some View {
           VStack {
               Text(dateString(date))
                   .font(.headline)
                   .foregroundColor(.pink) // ピンク色のテキスト

               TextEditor(text: $diaryText)
                   .padding()
                   .background(Color.white) // 白色の背景
                   .border(Color.pink, width: 2) // ピンク色の境界線
                   .cornerRadius(15) // 角を丸くする
                   .shadow(color: .gray, radius: 2, x: 2, y: 2) // 影を追加
               Button(action: {
                              saveDiaryEntry()
                              presentationMode.wrappedValue.dismiss() // この行で前のビューに戻ります
                          }) {
                              Text("保存")
                                  .padding(.horizontal, 30)
                                  .padding(.vertical, 10)
                                  .background(Color.pink)
                                  .foregroundColor(.white)
                                  .cornerRadius(10)
                          }
           }
           .padding()
           .background(Color(red: 1.0, green: 0.9, blue: 0.9)) // ソフトピンクの背景
           .edgesIgnoringSafeArea(.all)
           .onAppear(perform: loadDiaryEntry)
           .onDisappear(perform: saveDiaryEntry)
       }
    
    func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    // ここに日記の読み込み・保存のメソッドを追加します
    func loadDiaryEntry() {
        let key = dateKey(for: date)
        diaryText = UserDefaults.standard.string(forKey: key) ?? ""
    }

    func saveDiaryEntry() {
        let key = dateKey(for: date)
        UserDefaults.standard.setValue(diaryText, forKey: key)
    }

    func dateKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(date: Date())
    }
}
