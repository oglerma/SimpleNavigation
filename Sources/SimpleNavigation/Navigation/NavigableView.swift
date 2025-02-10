
import SwiftUI

/// A protocol that marks views as navigable destinations
public protocol NavigableView: Hashable, View {
    var viewIdentifier: String { get }
}
