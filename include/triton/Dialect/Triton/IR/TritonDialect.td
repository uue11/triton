#ifndef TRITON_DIALECT
#define TRITON_DIALECT

include "mlir/IR/OpBase.td"

def Triton_Dialect : Dialect {
  let name = "tt";

  let cppNamespace = "::mlir::triton";

  let summary = "The Triton IR in MLIR";

  let description = [{
    Triton Dialect.

    Dependent Dialects:
      * Arith:
        * addf, addi, andi, cmpf, cmpi, divf, fptosi, ...
      * Math:
        * exp, sin, cos, log, ...
      * StructuredControlFlow:
        * ForOp, IfOp, WhileOp, YieldOp, ConditionOp
  }];

  let dependentDialects = [
    "arith::ArithDialect",
    "math::MathDialect",
    "scf::SCFDialect",
    "cf::ControlFlowDialect",
    "func::FuncDialect"
  ];

  let extraClassDeclaration = [{
    void registerTypes();
  }];

  let hasConstantMaterializer = 1;
  let useDefaultTypePrinterParser = 1;
}

include "triton/Dialect/Triton/IR/TritonTypes.td"


#endif // TRITON_DIALECT
