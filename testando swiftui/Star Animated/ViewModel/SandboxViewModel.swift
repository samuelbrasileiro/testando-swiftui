//
//  SandboxViewModel.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import Foundation
import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var velocity: CGFloat
    @Published var stars: [Star] = []
    let sandboxWidth: CGFloat
    let sandboxHeight: CGFloat
    
    init(velocity: CGFloat = 20,
         sandboxWidth: CGFloat,
         sandboxHeight: CGFloat) {
        self.velocity = velocity
        self.sandboxWidth = sandboxWidth
        self.sandboxHeight = sandboxHeight
    }
    
    func addStar() {
        let star = Star()
        guard let direction = (0 ..< 360).randomElement() else { return }
        let radian = CGFloat(direction) * CGFloat.pi / 180
        (star.vx, star.vy) = (cos(radian), sin(radian))
        stars.append(star)
        star.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.ride(star)
        }
    }
    
    func removeStar() {
        guard let star = stars.first else { return }
        star.timer?.invalidate()
        stars.removeFirst()
    }
    
    private func ride(_ star: Star) {
        star.run(velocity)
        if didCollideSandbox(star) {
            changeDirection(star)
        }
        objectWillChange.send()
    }
    
    private func didCollideSandbox(_ star: Star) -> Bool {
        return (star.x - star.size/2) < -sandboxWidth/2
        || (star.y - star.size/2) < -sandboxHeight/2
        || (star.x + star.size/2) > sandboxWidth/2
        || (star.y + star.size/2) > sandboxHeight/2
    }
    
    private func changeDirection(_ star: Star) {
        if (star.x - star.size/2) <= -sandboxWidth/2
            || (star.x + star.size/2) >= sandboxWidth/2 {
            star.vx = -star.vx
            star.x = min(max(star.x, -sandboxWidth/2), sandboxWidth/2)
        } else if (star.y - star.size/2) <= -sandboxHeight/2
                    || (star.y + star.size/2) >= sandboxHeight/2 {
            star.vy = -star.vy
            star.y = min(max(star.y, -sandboxHeight/2), sandboxHeight/2)
        }
    }
}
