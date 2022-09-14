#include "Instrument.h"
#include "Utils.h"

using namespace llvm;

namespace instrument {

const auto PASS_NAME = "StaticAnalysisPass";
const auto PASS_DESC = "Static Analysis Pass";

bool Instrument::runOnFunction(Function &F) {
  auto FunctionName = F.getName().str();
  outs() << "Running " << PASS_DESC << " on function " << FunctionName << "\n";

  outs() << "Locating Instructions\n";
  for (inst_iterator Iter = inst_begin(F), E = inst_end(F); Iter != E; ++Iter) {
    Instruction &Inst = (*Iter);
    llvm::DebugLoc DebugLoc = Inst.getDebugLoc();
    if (!DebugLoc) {
      // Skip Instruction if it doesn't have debug information.
      continue;
    }

    int Line = DebugLoc.getLine();
    int Col = DebugLoc.getCol();
    outs() << Line << ", " << Col << "\n";

    
    
    
    /**
     * TODO: Add code to check if the instruction is a BinaryOperator and if so,
     * print the information about its location and operands as specified in the
     * Lab document.
     */
    /* Try to cast Inst to BinarayOperator.
    *   1. binary = null, not a binary operator
    *   2. binaray !=null it is a binary operator.
    *   We will print message based on if 2 condition is met
    */
    auto *biop = dyn_cast<BinaryOperator>(&Inst);
    //
    if(biop){ 
      auto Operator = biop->getOpcode();
      //get symbol
      char operator_symbol = getBinOpSymbol(Operator);
      //get first Operand
      auto op1 = biop->getOperand(0);
      //get second Operand
      auto op2 = biop->getOperand(1);
      /*Using getBinOpName() to get the operator name
      * variable() to dereferencing Value* and get the object name
      */
      outs() << getBinOpName(operator_symbol) << " on Line " <<Line <<", Column "<<Col<<" with first operand "<< variable(op1) << " and second operand " << variable(op2) << "\n";
    }
  }
  return false;
}

char Instrument::ID = 1;
static RegisterPass<Instrument> X(PASS_NAME, PASS_NAME, false, false);

} // namespace instrument
