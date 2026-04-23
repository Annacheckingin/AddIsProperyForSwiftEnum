import SwiftSyntax
import SwiftSyntaxMacros

public struct AddIsPropertiesMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let enumDecl = declaration.as(EnumDeclSyntax.self) else {
            return []
        }

        var properties: [DeclSyntax] = []

        // 遍历所有 case
        for member in enumDecl.memberBlock.members {
            if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                for element in caseDecl.elements {
                    let caseName = element.name.text
                    // 将首字母大写
                    let capitalizedName = caseName.prefix(1).uppercased() + caseName.dropFirst()
                    
                    // 生成 isXXX 属性
                    let property = """
                    var is\(capitalizedName): Bool {
                        if case .\(caseName) = self { return true }
                        return false
                    }
                    """
                    properties.append(DeclSyntax(stringLiteral: property))
                }
            }
        }
        return properties
    }
}

// 关键：注册宏插件
