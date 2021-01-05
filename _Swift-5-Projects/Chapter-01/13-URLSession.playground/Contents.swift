import Foundation

// DOWNLOADING

func moveFile(file: URL, dst: URL) {
    do {
        let savedUrl = dst.appendingPathComponent(file.lastPathComponent)
        print ("file error: \(savedUrl)")
        try FileManager.default.moveItem(at: file, to: savedUrl)
    } catch {
        print ("file error: \(error)")
    }
}

func downloadFileInOneShot(url : URL?, dstUrl : URL) {
    
    guard let url = url else {
        print("No URL provided")
        return
    }
    
    let downloadTask = URLSession.shared.downloadTask(with: url) {
        urlOrNil, responseOrNil, errorOrNil in
        
        if let error = errorOrNil {
            print("Download error \(error)")
            return
        }
        guard let response = responseOrNil as? HTTPURLResponse else {
            print("Unexpected error")
            return
        }
        
        if (response.statusCode < 200 && response.statusCode > 299) {
            print("Server returned HTTP error: \(response.statusCode)")
            return
        }
        
        guard let fileUrl = urlOrNil else {
            print("Unexpected error: missing local path")
            return
        }
        moveFile(file: fileUrl, dst: dstUrl)
    }
    downloadTask.resume()
}


let downloadURL = URL(string: "http://placehold.it/1200x1200&text=image1")

do {
    let documentsUrl = try
        FileManager.default.url(for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: true)

    downloadFileInOneShot(url: downloadURL, dstUrl : documentsUrl)
    
} catch {
    print ("Could not find destination directory")
}

// DOWNLOAD AND SHOW PROGRESS INFO

class FileDownloader : NSObject, URLSessionDownloadDelegate  {

    private var task : URLSessionDownloadTask?
    private var dstDir : URL?
    
    private lazy var urlSession = URLSession(configuration: .default,
                                             delegate: self,
                                             delegateQueue: nil)
    
    func startDownload(url: URL, dstDir: URL) {
        self.dstDir = dstDir
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        self.task = downloadTask
    }


    // While download progresses:
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        if downloadTask == self.task {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            print("Progress: \(progress)")
        }
    }

    // If download fails
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {

        guard let response = downloadTask.response as? HTTPURLResponse else {
            print("File Downloader unexpected error")
            return
        }
        
        if (response.statusCode < 200 && response.statusCode > 299) {
            print("Server returned HTTP error: \(response.statusCode)")
            return
        }
        moveFile(file: location, dst: dstDir!)
    }

}

do {
    let dstDir = try
        FileManager.default.url(for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: true)

    FileDownloader().startDownload(url: downloadURL!, dstDir: dstDir)
} catch {
    print ("Could not find destination directory")
}


// UPLOADING

func uploadDataInOneShot<T : Codable>(url : URL, data : T) {
    
    guard let uploadData = try? JSONEncoder().encode(data) else {
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
        if let error = error {
            print ("UploadData error: \(error)")
            return
        }
        guard let response = response as? HTTPURLResponse else {
            print("Unexpected error")
            return
        }
        
        if (response.statusCode < 200 && response.statusCode > 299) {
            print("Server returned HTTP error: \(response.statusCode)")
            return
        }
        
        if let mimeType = response.mimeType, mimeType == "application/json",
            let data = data,
            let dataString = String(data: data, encoding: .utf8) {
            print ("Upload response data: \(dataString)")
        }
    }
    task.resume()
}


struct JSONPlaceholderTodo : Codable {
    let userId : Int
    let id : Int?
    let title : String
    let completed : Bool
}

let td = JSONPlaceholderTodo(userId: 100, id: nil, title: "Doing Laundry", completed: true)


let postUrl = URL(string: "https://jsonplaceholder.typicode.com/todos")!
uploadDataInOneShot(url: postUrl, data: td)


// REST GET

func get<T: Codable>(url: URL, callback: @escaping (T?, Error?) -> Void) -> URLSessionTask {
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            callback(nil, error)
            return
        }
        
        guard let data = data else {
            //callback(nil, makeError)
            return
        }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            callback(result, nil)
        } catch let error {
            callback(nil, error)
        }
    }
    task.resume()
    return task
}

func post<T: Codable>(url: URL, value : T, callback: @escaping (T?, Error?) -> Void) {
    
    do {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(value)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                callback(nil, error)
                return
            }

            if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    callback(result, nil)
                } catch let error {
                    callback(nil, error)
                }
            }
        }
        task.resume()
    } catch let error {
        print("Post Error: \(error)")
    }
}

let getUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
get(url: getUrl) { (result : JSONPlaceholderTodo?, error) in
    
    // error handling left as an exercise to the reader
    print("Get Request result: \(String(describing: result))")
    print("Get Request error: \(String(describing: error))")
}

post(url: postUrl, value: td) { (result : JSONPlaceholderTodo?, error) in
    
    // error handling left as an exercise to the reader
    print("Post Request result: \(String(describing: result))")
    print("Post Request error: \(String(describing: error))")
}

