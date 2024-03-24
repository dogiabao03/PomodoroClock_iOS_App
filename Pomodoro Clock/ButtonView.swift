//
//  ButtonView.swift
//  Pomodoro Clock
//
//  Created by baodo on 26/12/2023.
//

import SwiftUI

/*struct ButtonView: View {
    var buttonText : String = ""
    var body: some View {
            Button{
                
            } label: {
                Text(buttonText).bold().foregroundColor(Color("myRed"))
            }.frame(width: 100, height: 50).background(Color("pink2")).cornerRadius(15)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "...")
    }
}*/

struct ButtonView: View {
    var buttonText: String = ""
    var action: () -> Void
    
    init(buttonText: String, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .bold()
                .foregroundColor(Color("myRed"))
        }
        .frame(width: 100, height: 50)
        .background(Color("pink2"))
        .cornerRadius(15)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "...") {
            // Handle button tap action
        }
    }
}

