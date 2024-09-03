//
//  CustomPicker.swift
//  HongikYeolgong2-iOS
//
//  Created by 석기권 on 7/18/24.
//

import Foundation
import SwiftUI
import UIKit

struct HY2Picker<T: Equatable>: UIViewRepresentable {
    
    @Binding var selected: T
    
    let items: [T]
    
    func makeCoordinator() -> Coordinator {
        return HY2Picker.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIPickerView {
        let picker = UIPickerView()
        picker.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        
        // 처음 Picker가 나타날때 현재시간으로 설정
        if items.randomElement() as? Int != nil,
            let findIndex = items.enumerated().map({ $0 }).firstIndex(where: ({$0.element == selected && $0.offset >= items.count / 2})) {
            
            picker.selectRow(findIndex, inComponent: 0, animated: false)
            
        } else if let seleted = selected as? String {
            picker.selectRow(seleted == "AM" ? 0 : 1, inComponent: 0, animated: false)
        }
        
        return picker
    }
    
    func updateUIView(_ uiView: UIPickerView, context: UIViewRepresentableContext<HY2Picker>) {
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        var parent: HY2Picker
        
        init(parent: HY2Picker) {
            self.parent = parent
        }
        
        // row개수
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.items.count
        }
        
        // picker 개수
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            // 숫자위에 상자 제거
            pickerView.subviews[1].alpha = 0
            
            // label을 감싸는 view
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: 35))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            
            if let number = parent.items[row] as? Int {
                label.text = String(format: "%02d", number)
            } else {
                label.text = "\(parent.items[row])"
            }
            
            label.textColor = UIColor(.white)
            label.textAlignment = .center
            label.font = UIFont(name: "SUITE-Bold", size: 24)
            
            view.addSubview(label)
            
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selected = parent.items[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 43
        }
    }
}
