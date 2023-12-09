import Foundation
import UIKit

extension NSDiffableDataSourceSnapshot {
    
    func hasSection(_ section: SectionIdentifierType) -> Bool {
        sectionIdentifiers.contains(section)
    }
    
    func isSectionEmpty(_ section: SectionIdentifierType) -> Bool {
        numberOfItems(inSection: section) == .zero
    }
    
    mutating func appendSectionIfNeeded(_ section: SectionIdentifierType) {
        guard !hasSection(section) else { return }
        appendSections([section])
    }
    
    mutating func deleteSection(_ section: SectionIdentifierType) {
        guard hasSection(section) else { return }
        deleteSections([section])
    }
    
    mutating func deleteSectionIfEmpty(_ section: SectionIdentifierType) {
        guard hasSection(section), isSectionEmpty(section) else { return }
        deleteSections([section])
    }
    
    mutating func deleteItemsInSection(_ section: SectionIdentifierType,
                                       _ items: [ItemIdentifierType]) {
        guard hasSection(section) else { return }
        deleteItems(items)
    }
    
    func lastItem(_ section: SectionIdentifierType) -> ItemIdentifierType? {
        guard hasSection(section) else { return nil }
        return itemIdentifiers(inSection: section).last
    }
    
    mutating func deleteAllItemsIfNeeded() {
        guard numberOfItems != .zero else { return }
        deleteAllItems()
    }
    
    mutating func deleteAllSectionsIfNeeded() {
        guard numberOfSections != .zero else { return }
        deleteSections(sectionIdentifiers)
    }
}
