//
//  Plugin.swift
//  AddIsProperties
//
//  Created by Lee on 2026/4/23.
//

// Plugin.swift
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct AddIsPropertiesPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        AddIsPropertiesMacro.self
    ]
}
