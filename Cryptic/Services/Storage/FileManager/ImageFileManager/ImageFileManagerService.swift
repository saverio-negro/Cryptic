//
//  ImageFileManagerService.swift
//  Cryptic
//
//  Created by Saverio Negro on 9/8/26.
//

import SwiftUI

enum ImageFileManagerServiceError: LocalizedError {
    
    case failedEncodingImageToData
    case badFilePath
    case cannotWriteToFilePath
    case imageDoesNotExist(url: URL)
    case cannotReadFileContents(url: URL)
    
    var errorDescription: String? {
        switch self {
        case .failedEncodingImageToData:
            return "Failed encoding image to data."
        case .badFilePath:
            return "Invalid image file path."
        case .cannotWriteToFilePath:
            return "Cannot save image to file path."
        case .imageDoesNotExist(let url):
            return "Image does not exist at file path: \(url)"
        case .cannotReadFileContents(let url):
            return "Cannot read file contents at file path: \(url)"
        }
    }
}


class ImageFileManagerService: FileManagerService {
    
    typealias Value = UIImage
    let imageFolderName: String
    
    init(imageFolderName: String) {
        self.imageFolderName = imageFolderName
    }
    
    func save(value: UIImage, fileName: String) throws {
        
        // Create folder if not yet existing
        self.createFolder(withName: imageFolderName, in: .cachesDirectory)
        
        // Encode image to data
        guard
            let data = value.pngData()
        else {
            throw ImageFileManagerServiceError.failedEncodingImageToData
        }
        
        // Get path for image
        guard
            let url = self.getURLForFile(
                withName: fileName,
                in: .cachesDirectory,
                in: imageFolderName
            )
        else {
            throw ImageFileManagerServiceError.badFilePath
        }
        
        // Save image to path
        do {
           try data.write(to: url)
        } catch {
            throw ImageFileManagerServiceError.cannotWriteToFilePath
        }
    }
    
    func get(fileName: String) throws -> UIImage {
        
        guard
            let url = self.getURLForFile(
            withName: fileName,
            in: .cachesDirectory,
            in: imageFolderName
            )
        else {
            throw ImageFileManagerServiceError.badFilePath
        }
        
        if !FileManager.default.fileExists(atPath: url.path()) {
            throw ImageFileManagerServiceError.imageDoesNotExist(url: url)
        }
        
        guard
            let image = UIImage(contentsOfFile: url.path())
        else {
            throw ImageFileManagerServiceError.cannotReadFileContents(url: url)
        }
        
        return image
    }
}

