//
//  FileManagerService.swift
//  Cryptic
//
//  Created by Saverio Negro on 9/8/26.
//

import Foundation

protocol FileManagerService {
    
    associatedtype Value
    
    func save(value: Value, fileName: String) throws
    func get(fileName: String) throws -> Value
}

extension FileManagerService {
    
    func getURLForFolder(withName folderName: String?, in directory: FileManager.SearchPathDirectory) -> URL? {
        
        guard
            var url = FileManager.default.urls(for: directory, in: .userDomainMask).first
        else {
            return nil
        }
        
        if let folderName = folderName {
            url = url.appending(path: folderName)
        }
        
        return url
    }
    
    func getURLForFile(
        withName name: String,
        in directory: FileManager.SearchPathDirectory,
        in folderName: String?
    ) -> URL? {
        guard
            let folderName = getURLForFolder(withName: folderName, in: directory)
        else {
            return nil
        }
        
        return folderName.appending(path: name)
    }
    
    func createFolder(withName folderName: String, in directory: FileManager.SearchPathDirectory) {
        
        guard
            let url = self.getURLForFolder(withName: folderName, in: .cachesDirectory)
        else {
            return
        }
        
        if FileManager.default.fileExists(atPath: url.path()) { return }
        
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        } catch let error {
            print("Failed creating '\(folderName)' directory: \(error)")
        }
    }
}

