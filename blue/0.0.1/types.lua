-- General
---@alias LnCol {ln: number, col: number}
---@alias StoreValue number|boolean|string|nil

-- TOKENIZER
---@alias TokenType TokenTypeSymbol|TokenTypeValue|TokenTypeKeyword|TokenTypeSpecial
---@alias TokenTypeSymbol "add"|"sub"|"mul"|"div"|"percent"|"caret"|"hash"|"left_square_bracket"|"right_square_bracket"|"left_bracket"|"right_bracket"|"left_parenthesis"|"right_parenthesis"|"greater_than"|"less_than"|"equals"|"comma"|"colon"|"dot"|"semi_colon"
---@alias TokenTypeValue "bool"|"string"|"number"|"ident"
---@alias TokenTypeKeyword "CONST"|"STRUCT"|"ENUM"|"FN"|"IMPL"|"TRAIT"|"LET"|"IF"|"ELSE"|"FOR"|"IN"|"RETURN"|"BREAK"|"ANY"
---@alias TokenTypeSpecial "internal"|"cc"
---@alias Token {type: TokenType, value: StoreValue, ln_col: LnCol}
---@alias TokenizerError {details: string, ln_col: LnCol, code_line: string}

-- PARSER
---@alias Program {meta: Meta, items: Item[]}
---@alias Meta {run: string, lib: boolean}
---@alias ParserError {details: string, ln_col: LnCol}

---@alias Item ItemFn|ItemStruct|ItemEnum
---@alias ItemFn {type: "fn", name: string, inputs: string[], stmts: Stmt[]}
---@alias ItemStruct NamedStruct|UnnamedStruct
---@alias NamedStruct {type: "struct", name: string, fields: table<string, string>}
---@alias UnnamedStruct {type: "tuple", name: string, fields: string[]}
---@alias ItemEnum {type: "enum", name: string, variants: string[] }

---@alias Stmt Declare|Assign|ExprCall|ExprCCCall
---@alias Declare {type: "declare", name: string, expr: Expr}
---@alias Assign {type: "assing", name: string, expr: Expr}

---@alias Expr ExprBlock|ExprBinOp|ExprUnaryOp|ExprCCCall|ExprLiteral
---@alias ExprBlock {type: "block", stmts: Stmt[]}
---@alias ExprBinOp {type: "add"|"sub"|"mul"|"div"|"percent"|"caret", left: Expr, right: Expr}
---@alias ExprUnaryOp {type: "add"|"sub", left: Expr, right: Expr}
---@alias ExprCCCall {type: "cc", namespace: string|nil, func: string, input: ExprLiteral[]}
---@alias ExprInternalCall {type: "internal", func: string, input: ExprLiteral[]}
---@alias ExprCall {type: "call"}
---@alias ExprLiteral {type: TokenTypeValue, value: StoreValue, ln_col: LnCol}

-- INTERPRETER
---@alias InterpreterError {details: string, ln_col: LnCol}

-- ENVIRONMENT
---@alias VariableSettings {mutable: boolean}
---@alias Variable {value: Item|ExprLiteral, settings: VariableSettings}
---@alias Environment {last: Environment|nil, current: table<string, Variable>}