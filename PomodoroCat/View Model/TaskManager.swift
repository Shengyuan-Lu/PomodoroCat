import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    @Published var task = Task(pomodoroSeconds: 25, relaxSeconds: 5, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    
    @Published var isWorking = true
    
    func timerFirePerSecond() {
        if task.pomodoroSeconds != 0 {
            task.pomodoroSeconds -= 1
            
            task.pomodoroTo = CGFloat(task.pomodoroSeconds / (task.totalSeconds))
            
        } else if task.pomodoroSeconds == 0 && task.relaxSeconds != 0 {
            
            self.isWorking = false
            
            task.relaxSeconds -= 1
            
            task.relaxTo = CGFloat(task.relaxSeconds / (task.totalSeconds))
            
        } else if task.relaxSeconds == 0 {
            self.resetTask()
        }
    }
    
    func resetTask() {
        self.isWorking = true
        self.task = Task(pomodoroSeconds: 25, relaxSeconds: 5, pomodoroDegree: 120, relaxDegreeWithPomodoro: -90)
    }
    
    func getCurrentNumMin() -> Int {
        if task.pomodoroSeconds != 0 {
            return Int(task.pomodoroSeconds)
            
        } else if task.pomodoroSeconds == 0 && task.relaxSeconds != 0 {
            
            return Int(task.relaxSeconds)
            
        } else if task.relaxSeconds == 0 {
            return 0
        }
        
        return 0
    }
}