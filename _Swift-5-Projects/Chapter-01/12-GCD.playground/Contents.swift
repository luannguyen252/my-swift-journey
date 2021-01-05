import Dispatch

// dispatch async task on global queue; signal main queue
DispatchQueue.global(qos: .userInitiated).async {
    print("Running hi-priority async task on background queue")
    DispatchQueue.main.async {
        print("Complete task on main queue (e.g., UI refresh)")
    }
}

// create a serial queue
let serialQueue = DispatchQueue(label: "com.packtpub.swift5projects",
                                qos: .background)

serialQueue.async {
    print("Running async task on serial queue")
}

// define a custom QoS attribute
let qos = DispatchQoS(qosClass: .background, relativePriority: 1)

// create a concurrent queue
let concurrentQueue = DispatchQueue(label: "com.packtpub.swift5projects",
                                    qos: qos,
                                    attributes: [.concurrent, .initiallyInactive])

concurrentQueue.async {
    print("Running async task on concurrent queue")
}

// since we specified the .initiallyInactive attribute, we need to explicitly activate the queue
concurrentQueue.activate()



// Making non-thread-safe resource thread safe
protocol ResourceProtocol {
    associatedtype T
    
    //var resource : T { get set }
    
    init(status : T)
    func changeResourceStatus(status : T)
    func getResourceStatus() -> T
}

class MakeThreadSafe<T : ResourceProtocol> {
    
    private let queue = DispatchQueue(label:"ResourceQueue")
    private var resource : T
    
    required init (status : T.T) { self.resource = T(status : status) }
    
    func changeResourceStatus(status : T.T) { queue.sync { self.resource.changeResourceStatus(status : status) }}
    func getResourceStatus() -> T.T { return queue.sync { self.resource.getResourceStatus() }}
}


class NonThreadSafeResource : ResourceProtocol {
    var resource = 0
    
    required init (status : Int) { self.resource = status }
    
    func changeResourceStatus(status : Int) { self.resource = status }
    func getResourceStatus() -> Int { return self.resource}
}

var threadSafeResource = MakeThreadSafe<NonThreadSafeResource>(status: 0)

// thw two async tasks are started one after the other, without guarantee that the first task has completed before starting the second -- the inner serial queue makes everything safe
concurrentQueue.async { threadSafeResource.changeResourceStatus(status: 2) }
concurrentQueue.async { print(threadSafeResource.getResourceStatus()) }



// SEMAPHORES

let sem = DispatchSemaphore(value: 2)

// this is used to simulate a varying running time for tasks
func releaseAfter(seconds : Double) {
    concurrentQueue.asyncAfter(deadline: DispatchTime.now() + 1) {
        sem.signal()
    }
}

func task(n : Int) {
    print("Running async task \(n): Waiting for access granted")
    sem.wait()
    print("Running async task \(n): Got access")
    releaseAfter(seconds: Double(n) * 0.5)
}

concurrentQueue.async {
    task(n: 1)
}

concurrentQueue.async {
    task(n: 2)
}

concurrentQueue.async {
    task(n: 3)
}

concurrentQueue.async {
    task(n: 4)
}


// DISPATCH GROUPS

let workerGroup = DispatchGroup()

func doSomeLengthyTask(seconds : Double) {
    workerGroup.enter()
    concurrentQueue.asyncAfter(deadline: DispatchTime.now() + 1) {
        workerGroup.leave()
    }
}

doSomeLengthyTask(seconds: 1.0)
doSomeLengthyTask(seconds: 1.5)
doSomeLengthyTask(seconds: 2.0)

let block = DispatchSemaphore(value: 0)

workerGroup.notify(queue: concurrentQueue) {
    print("Worker Group Completed")
    block.signal()
}

block.wait()

print("Continuing after Group Completed")
