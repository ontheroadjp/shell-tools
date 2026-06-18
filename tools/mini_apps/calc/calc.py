#!/usr/bin/env python3

import ast
import math
import operator
import sys


CONSTANTS = {
    "e": math.e,
    "pi": math.pi,
    "tau": math.tau,
}

FUNCTIONS = {
    "abs": abs,
    "acos": math.acos,
    "asin": math.asin,
    "atan": math.atan,
    "ceil": math.ceil,
    "cos": math.cos,
    "degrees": math.degrees,
    "exp": math.exp,
    "floor": math.floor,
    "log": math.log,
    "log10": math.log10,
    "ln": math.log,
    "radians": math.radians,
    "round": round,
    "sin": math.sin,
    "sqrt": math.sqrt,
    "tan": math.tan,
}

BIN_OPS = {
    ast.Add: operator.add,
    ast.Sub: operator.sub,
    ast.Mult: operator.mul,
    ast.Div: operator.truediv,
    ast.FloorDiv: operator.floordiv,
    ast.Mod: operator.mod,
    ast.Pow: operator.pow,
}

UNARY_OPS = {
    ast.UAdd: operator.pos,
    ast.USub: operator.neg,
}


class CalcError(Exception):
    pass


def evaluate(node):
    if isinstance(node, ast.Expression):
        return evaluate(node.body)

    if isinstance(node, ast.Constant) and isinstance(node.value, (int, float)):
        return node.value

    if isinstance(node, ast.BinOp) and type(node.op) in BIN_OPS:
        return BIN_OPS[type(node.op)](evaluate(node.left), evaluate(node.right))

    if isinstance(node, ast.UnaryOp) and type(node.op) in UNARY_OPS:
        return UNARY_OPS[type(node.op)](evaluate(node.operand))

    if isinstance(node, ast.Name) and node.id in CONSTANTS:
        return CONSTANTS[node.id]

    if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
        func = FUNCTIONS.get(node.func.id)
        if func is None:
            raise CalcError(f"unsupported function: {node.func.id}")
        if node.keywords:
            raise CalcError("keyword arguments are not supported")
        return func(*(evaluate(arg) for arg in node.args))

    raise CalcError("unsupported expression")


def format_result(value):
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value)


def usage():
    command = "calc"
    print(f"Usage: {command} <expression>")
    print(f"Examples: {command} 3+3")
    print(f"          {command} 'sqrt(9) + pi'")


def main(argv):
    if not argv or argv[0] in {"-h", "--help"}:
        usage()
        return 0 if argv else 1

    expression = " ".join(argv)
    try:
        tree = ast.parse(expression, mode="eval")
        print(format_result(evaluate(tree)))
    except (CalcError, SyntaxError, ValueError, TypeError, ZeroDivisionError) as error:
        print(f"calc: {error}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
