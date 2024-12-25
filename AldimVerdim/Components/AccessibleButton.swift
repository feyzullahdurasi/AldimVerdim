import SwiftUI

struct AccessibleButton: View {
    let title: String
    let action: () -> Void
    let icon: String?
    let style: CustomButtonStyle
    
    init(
        title: String,
        icon: String? = nil,
        style: CustomButtonStyle = .primary,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .accessibility(hidden: true)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(style.backgroundColor)
            .foregroundColor(style.textColor)
            .cornerRadius(10)
        }
        .accessibilityLabel(title)
        .accessibilityHint("Tap to \(title.lowercased())")
    }
}

enum CustomButtonStyle {
    case primary
    case secondary
    case destructive
    
    var backgroundColor: Color {
        switch self {
        case .primary: return .pink
        case .secondary: return .gray.opacity(0.2)
        case .destructive: return .red
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary: return .white
        case .secondary: return .black
        case .destructive: return .white
        }
    }
} 