//
//  Alignment.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 07/11/2021.
//

import Foundation
import SwiftUI

extension View {
    func alignment(_ alignment: Alignment) -> some View {
        return self.frame(maxWidth: alignment == .bottom || alignment == .top ? nil : .infinity,
                          maxHeight: alignment == .leading || alignment == .trailing ? nil : .infinity,
                          alignment: alignment)
    }
}
