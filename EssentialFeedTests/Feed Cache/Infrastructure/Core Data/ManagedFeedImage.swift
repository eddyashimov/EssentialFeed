//
//  ManagedFeedImage.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 11/11/21.
//

import CoreData
import EssentialFeed

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var imageDescription: String?
    @NSManaged public var location: String?
    @NSManaged public var url: URL
    @NSManaged public var cache: ManagedCache
    
    static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: localFeed.map { local in
            let managed = ManagedFeedImage(context: context)
            managed.id = local.id
            managed.imageDescription = local.description
            managed.location = local.location
            managed.url = local.url
            return managed
        })
    }

    var local: LocalFeedImage {
        return LocalFeedImage(id: id!, description: imageDescription, location: location, url: url)
    }
    
}
