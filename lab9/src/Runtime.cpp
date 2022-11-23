#include <iostream>

#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"

#include "SymbolicInterpreter.h"

extern SymbolicInterpreter SI;

z3::expr eval(z3::expr &E) {
  if (E.kind() == Z3_NUMERAL_AST) {
    return E;
  } else {
    MemoryTy Mem = SI.getMemory();
    Address Register(E);
    if (Mem.find(Register) != Mem.end()) {
      return Mem.at(Register);
    } else {
      std::cout << "Warning: Cannot find register " << Register << " in memory "
                << std::endl;
      return E;
    }
  }
}

/**
 * @brief Symbolically evaluate Alloca
 *
 * @param R RegisterID
 * @param Ptr Address
 */
extern "C" void __DSE_Alloca__(int R, int *Ptr) {
  MemoryTy &Mem = SI.getMemory();
  Address Register(R);
  z3::expr SE = SI.getContext().int_val((uintptr_t)Ptr);
  Mem.insert(std::make_pair(Register, SE));
}

/**
 * @brief Symbolically evaluate Store
 *
 * @param X Address
 */
extern "C" void __DSE_Store__(int *X) {
  
  MemoryTy &Mem = SI.getMemory(); //map from address to 
  Address Addr(X);
  z3::expr SE = eval(SI.getStack().top());
  SI.getStack().pop(); //anything in the stack should be used to evalutate 
  Mem.erase(Addr); //overwirte  z3::expr 
  Mem.insert(std::make_pair(Addr, SE)); //insert a new pair to the Map
  //Addr, 
}

/**
 * @brief Symbolically evaluate Load
 *
 * TODO: Implement this.
 *
 * @param Y Address of destination
 * @param X Address of Load source
 * z3 expression at X pass to Y
 */
extern "C" void __DSE_Load__(int Y, int *X) {
  //pointer 
  //%y = load i32, i32* %x, align 4
  MemoryTy &Mem = SI.getMemory();
  Address Addr1(Y);
  Address Addr2(X);
  z3::expr E2 = Mem.at(Addr2);
  Mem.erase(Addr1);
  Mem.insert(std::make_pair(Addr1,E2));
}

/**
 * @brief Symbolically evaluate Comparisions
 *
 * TODO: Implement this.
 *
 * @param R Address of Comparision result
 * @param Op Operator Kind
 */
extern "C" void __DSE_ICmp__(int R, int Op) {
  MemoryTy &Mem = SI.getMemory();
  Address Addr(R);
  z3::expr op2 = eval(SI.getStack().top());
  SI.getStack().pop(); 
  z3::expr op1 = eval(SI.getStack().top());
  SI.getStack().pop(); 
  z3::expr SE =op2;
  Mem.erase(Addr);
  //switch case
  /*
  eq: equal
  ne: not equal
  ugt: unsigned greater than
  uge: unsigned greater or equal
  ult: unsigned less than
  ule: unsigned less or equal
  sgt: signed greater than
  sge: signed greater or equal
  slt: signed less than
  sle: signed less or equal
  */
  switch(Op){
    //equal
    case llvm::CmpInst::Predicate::ICMP_EQ:
    SE=(op1==op2);
    break;
    //not equal
    case llvm::CmpInst::Predicate::ICMP_NE:
    SE=(op1!=op2);
    break;
    //ugt
    //sgt
    case llvm::CmpInst::Predicate::ICMP_UGT :
    case llvm::CmpInst::Predicate::ICMP_SGT:
    SE= (op1>op2);
    break;
    //uge
    //sge
    case llvm::CmpInst::Predicate::ICMP_UGE:
    case llvm::CmpInst::Predicate::ICMP_SGE:
    SE = (op1>=op2);
    break;
    //ult
    //slt
    case llvm::CmpInst::Predicate::ICMP_ULT:
    case llvm::CmpInst::Predicate::ICMP_SLT:
    SE = (op1<op2);
    break;
    //ule
    //sle
    case llvm::CmpInst::Predicate::ICMP_ULE:
    case llvm::CmpInst::Predicate::ICMP_SLE:
    SE = (op1<=op2); 
    break;  
  }
  Mem.insert(std::make_pair(Addr,SE));


}

/**
 * @brief Symbolically evaluate Binary Operation.
 *
 * TODO: Implement this.
 *
 * @param R Address of Binary Operation result.
 * @param Op Operator Kind
 */
extern "C" void __DSE_BinOp__(int R, int Op) {
  MemoryTy &Mem = SI.getMemory();
  Address Addr(R);
  z3::expr op2 = eval(SI.getStack().top());
  SI.getStack().pop(); 
  z3::expr op1 = eval(SI.getStack().top());
  SI.getStack().pop(); 
  z3::expr  SE = SI.getContext().int_val((uintptr_t)R);
  Mem.erase(Addr);
  //addr = addr(R)
  switch (Op)
    {
    //+
    case llvm::BinaryOperator::BinaryOps::Add:
    case llvm::BinaryOperator::BinaryOps::FAdd:
      SE=op1+op2;
      break;
    //-
    case llvm::BinaryOperator::BinaryOps::Sub:
    case llvm::BinaryOperator::BinaryOps::FSub:
      SE=op1-op2;
      break;
    //*
    case llvm::BinaryOperator::BinaryOps::Mul:
    case llvm::BinaryOperator::BinaryOps::FMul:
      SE=op1*op2;
      break;
    //
    case llvm::BinaryOperator::BinaryOps::UDiv:
    case llvm::BinaryOperator::BinaryOps::SDiv:
    case llvm::BinaryOperator::BinaryOps::FDiv:
      SE=op1/op2;
      break;
    }
  Mem.insert(std::make_pair(Addr,SE));
}
