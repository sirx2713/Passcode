//
//  PasscodeView.swift
//  Passcode
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/20.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated:Bool
    @State var passcode = ""
    @State var wrongPasscode = ""
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24){
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Please enter your 4-digit pin to securely access your account")
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
            }.padding(.top)
            IndicatorView(passcode: $passcode)
            Text(wrongPasscode)
                .font(.footnote)
                .foregroundColor(.red)
            Spacer()
            NumberPadView(passcode: $passcode)
        }
        .onChange(of: passcode, { oldValue, newValue in
            verifyPasscode()
        })
    }
    
    private func verifyPasscode(){
        guard passcode.count == 4 else {
            return
        }
        Task{
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "0808"
           // showPasscodeError = !isAuthenticated
            passcode = ""
            
            if passcode != "0808"{
                wrongPasscode = "Wrong Passcode entered, Try Again!"
            }
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: Binding.constant(true))
}
