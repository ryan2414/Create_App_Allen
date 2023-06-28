//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by 이승재 on 2023/06/27.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "MemoData"
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [MemoData] {
        var toDoList: [MemoData] = []
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    toDoList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return toDoList
    }
    
    // MARK: - [Create] 코어데이터에 데이터 생성하기
    func saveToDoData(todoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        //임시 저장소 있는지 확인
        if let context = context {
            // 임시 저장소에 있는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                //임시 저장소에 올라가게 할 객체 만들기 ( NSManagedObject = > MemoData)
                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    
                    // MARK: - toDoData에 실제 데이터 할당
                    toDoData.memoText = todoText
                    toDoData.date = Date()
                    toDoData.color = colorInt
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
                
        }
        completion()
    }
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteToDo(data: MemoData, completion: @escaping () -> Void) {
        guard let date = data.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            //요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            //단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch 메서드)
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    // 임시 저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete 메서드)
                    if let targetToDo = fetchedToDoList.first {
                        context.delete(targetToDo)
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패 ")
                completion()
            }
        }
    }
    
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateToDo(newToDoData: MemoData, completion: @escaping () -> Void) {
        guard let date = newToDoData.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    if var targetToDo = fetchedToDoList.first {
                        
                        // MARK: - ToDoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo = newToDoData
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
}
