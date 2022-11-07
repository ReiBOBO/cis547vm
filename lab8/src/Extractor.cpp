#include "Extractor.h"

#include "llvm/IR/Instruction.h"

void Extractor::addDef(const InstMapTy &InstMap, Value *X, Instruction *L) {
  if (InstMap.find(X) == InstMap.end())
    return;
  DefFile << toString(X) << "\t" << toString(L) << "\n";
}

void Extractor::addUse(const InstMapTy &InstMap, Value *X, Instruction *L) {
  if (Constant *C = dyn_cast<Constant>(X))
    return;
  if (InstMap.find(X) == InstMap.end())
    return;
  UseFile << toString(X) << "\t" << toString(L) << "\n";
}

void Extractor::addDiv(const InstMapTy &InstMap, Value *X, Instruction *L) {
  if (Constant *C = dyn_cast<Constant>(X))
    return;
  if (InstMap.find(X) == InstMap.end())
    return;
  DivFile << toString(X) << "\t" << toString(L) << "\n";
}

void Extractor::addTaint(const InstMapTy &InstMap, Instruction *L) {
  TaintFile << toString(L) << "\n";
}

void Extractor::addSanitizer(const InstMapTy &InstMap, Instruction *L) {
  SanitizerFile << toString(L) << "\n";
}

void Extractor::addNext(const InstMapTy &InstMap, Instruction *X,
                        Instruction *Y) {
  NextFile << toString(X) << "\t" << toString(Y) << "\n";
};

/**
 * @brief Collects Datalog facts for each instruction to corresponding facts
 * file.
 */
void Extractor::extractConstraints(const InstMapTy &InstMap, Instruction *I) {
  /**
   * TODO: For each predecessor P of instruction I,
   *       add a new fact in the `next` relation.
   */
  auto preds = getPredecessors(I);
  for( auto &pred: preds){
    addNext(InstMap,pred,I);
  }

  /**
   * TODO:
   *
   *   For each of the instruction add appropriate facts:
   *     Add `def` and `use` relations.
   *   For `BinaryOperator` instructions involving division:
   *     Add a fact for the `div` relation.
   *   For `CallInst` instructions:
   *     Add a `def` relation only if it returns a non-void value.
   *     If its a call to tainted input,
   *       Add appropriate fact to `taint` relation.
   *     If its a call to sanitize,
   *       Add appropriate fact to `sanitizer` relation.
   *
   * NOTE: Many Values may be used in a single instruction,
   *       but at most one Value can be defined in one instruction.
   * NOTE: You can use `isTaintedInput()` and `isSanitizer()` function
   *       to check if a particular CallInst is a tainted input
   *       or sanitize respectively.
   */

  if (AllocaInst *AI = dyn_cast<AllocaInst>(I)) {
    // do nothing, alloca is just a declaration.
  } else if (StoreInst *SI = dyn_cast<StoreInst>(I)) {
    // TODO: Extract facts from StoreInst
    auto Pointer = SI->getPointerOperand();
    auto Value = SI->getValueOperand();
    auto ValueType = Value->getType();
    // if(ValueType->isIntegerTy()){
    //   addDef(InstMap,Pointer,SI);
    // }
    // else{
    //   /*
    //   y = alloca i32          ; I1
    //   a = load i32, i32* x    ; I3
    //   store i32 a, i32* y     ; I4
    //   stpre i32* , 
    //   addUse(I3,I4)
    //   addDef(I1,I4)
    //   */
      addUse(InstMap,Value,SI);
      addDef(InstMap,Pointer,SI);
    // }
    
  } else if (LoadInst *LI = dyn_cast<LoadInst>(I)) {
    // TODO: Extract facts from LoadInst
    auto Pointer = LI->getPointerOperand();
    addUse(InstMap,Pointer,LI);
    addDef(InstMap,LI,LI);
  } else if (BinaryOperator *BI = dyn_cast<BinaryOperator>(I)) {
    // TODO: Extract facts from BinaryOperation
     auto Operator = BI->getOpcode();
    // get first Operand
    auto op1 = BI->getOperand(0);
    // get second Operand
    auto op2 = BI->getOperand(1);
    switch(Operator){
    case Instruction::UDiv:
    case Instruction::SDiv:
    case Instruction::FDiv:
      addDiv(InstMap,op2,BI);
      
    }
    addUse(InstMap,op2,BI);
    addUse(InstMap,op1,BI);
    addDef(InstMap,BI,BI);
  } else if (CallInst *CI = dyn_cast<CallInst>(I)) {
    // TODO: Extract facts from CallInst
    if(isTaintedInput(CI)){
      addTaint(InstMap,CI);
    }
    if(isSanitizer(CI)){
      addSanitizer(InstMap,CI);
    }
    for (auto &I : CI->args()){
      addUse(InstMap,I,CI);
    }
    addDef(InstMap,CI,CI);
    //iterate args, and adding use-args
    //addUse(InstMap,CI,CI);
  } else if (CastInst *CI = dyn_cast<CastInst>(I)) {
    // TODO: Extract facts from CastInst
    auto op2 = CI->getOperand(1);
    addUse(InstMap,op2,CI);
    addDef(InstMap,CI,CI);

  } else if (CmpInst *CI = dyn_cast<CmpInst>(I)) {
    // TODO: Extract facts from CmpInst
    //do I care about the result of the cmp? i guess not
    auto op1 = CI->getOperand(0);
    auto op2 = CI->getOperand(1);
    auto op1Type = op1->getType();
    auto op2Type = op2->getType();
    // if(op1Type->isIntegerTy()&& !op2Type->isIntegerTy()){
    //   addUse(InstMap,op2,CI);
    // }
    // else if(!op1Type->isIntegerTy()&& op2Type->isIntegerTy()){
    //   addUse(InstMap,op1,CI);
    // }
    // else if(!op1Type->isIntegerTy()&& !op2Type->isIntegerTy()){
      
    // }
    addUse(InstMap,op1,CI);
    addUse(InstMap,op2,CI);
    addDef(InstMap,CI,CI);
  }
}
