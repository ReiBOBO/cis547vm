#include "DSEInstrument.h"

using namespace llvm;

namespace dse {

static const char *DSE_INIT_FUNCTION_NAME = "__DSE_Init__";
static const char *DSE_ALLOCA_FUNCTION_NAME = "__DSE_Alloca__";
static const char *DSE_STORE_FUNCTION_NAME = "__DSE_Store__";
static const char *DSE_LOAD_FUNCTION_NAME = "__DSE_Load__";
static const char *DSE_CONST_FUNCTION_NAME = "__DSE_Const__";
static const char *DSE_REGISTER_FUNCTION_NAME = "__DSE_Register__";
static const char *DSE_ICMP_FUNCTION_NAME = "__DSE_ICmp__";
static const char *DSE_BRANCH_FUNCTION_NAME = "__DSE_Branch__";
static const char *DSE_BINOP_FUNCTION_NAME = "__DSE_BinOp__";


/**
 * @brief Instrument to initialize the Z3 solver.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param F Function to Instrument
 * @param I Instrumentation location
 */
void instrumentDSEInit(Module *Mod, Function &F, Instruction &I) {
  auto initFunction =   Mod->getFunction(DSE_INIT_FUNCTION_NAME);
  std::vector<Value *> Args ={};
  CallInst::Create(initFunction,Args,"", &I);
}


/**
 * @brief Instrument to Alloca Instructions.
 *
 * @param Mod Current Module
 * @param AI Instrumentation location
 */
void instrumentAlloca(Module *Mod, AllocaInst *AI) {
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);

  Value *VarID = ConstantInt::get(Int32Type, getRegisterID(AI));
  std::vector<Value *> Args = {VarID, AI};

  auto Fun = Mod->getFunction(DSE_ALLOCA_FUNCTION_NAME);
  CallInst::Create(Fun, Args, "", AI->getNextNonDebugInstruction());
}

/**
 * @brief Instrument to Store Instructions.
 *
 * @param Mod Current Module
 * @param SI Instrumentation location
 */
void instrumentStore(Module *Mod, StoreInst *SI) {
  std::vector<Value *> Args = {SI->getPointerOperand()};
  auto Fun = Mod->getFunction(DSE_STORE_FUNCTION_NAME);
  CallInst::Create(Fun, Args, "", SI);
}

/**
 * @brief Instrument to Load Instructions.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param LI Instrumentation location
 */
void instrumentLoad(Module *Mod, LoadInst *LI) {
  // %6 = load i32, i32* %a, align 4
  // %6 = load i32*, i32** %a, align 4
  // sotre : , load not from stack , just copy from the symbolic memory for the source, put it to the dest
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  Value *VarID = ConstantInt::get(Int32Type, getRegisterID(LI));
  std::vector<Value *> Args = {VarID, LI->getPointerOperand()}; //switch getPointerOperand()
  auto Fun = Mod->getFunction(DSE_LOAD_FUNCTION_NAME);
  CallInst::Create(Fun, Args, "", LI);
}

/**
 * @brief Instrument Constant values.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param ConstInt Constant
 * @param I Instrumentation location.
 */
void instrumentConstantValue(Module *Mod, ConstantInt *ConstInt, Instruction *I) {
  // auto &Context = Mod->getContext();
  // auto *Int32Type = Type::getInt32Ty(Context);
  // auto val = ConstantInt::get(Int32Type, ConstInt);
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  std::vector<Value *> Args = {ConstInt};
  auto Func = Mod->getFunction(DSE_CONST_FUNCTION_NAME);
  CallInst::Create(Func, Args, "", I);
}

/**
 * @brief Instrument Registers.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param Var Variable
 * @param I Instrumentation location
 */
void instrumentRegister(Module *Mod, Value *Var, Instruction *I) {
  //__DSE_Register__(int X)
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  Value *VarID = ConstantInt::get(Int32Type, getRegisterID(Var));
  std::vector<Value *> Args = {VarID};
  auto Func = Mod->getFunction(DSE_REGISTER_FUNCTION_NAME);
  CallInst::Create(Func, Args, "", I);
}

/**
 * @brief Instrument a Value
 *
 * TODO: Implement this.
 *
 * Hint: Values are a stored in registers;
 *       some values may also be a constant.
 *       Use the function you just defined above.
 *
 * @param Mod Current Module
 * @param Val Value
 * @param I Instrumentation location
 */
void instrumentValue(Module *Mod, Value *Val, Instruction *I) {
  // try to case if this doesn't work
  
  if (ConstantInt *ConstInt = dyn_cast<ConstantInt>(Val)){
    
    instrumentConstantValue(Mod,ConstInt,I);
  }
  else{
    instrumentRegister(Mod,Val,I);
  }
}

/**
 * @brief Instrument Comparision Instructions.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param CI Instrumentation location
 */
void instrumentICmp(Module *Mod, ICmpInst *CI) {
  // Mod->getOrInsertFunction(DSE_ICMP_FUNCTION_NAME, VoidType, Int32Type, Int32Type);
  //ICMP take the ID of the register on the left hand side as their first argument and its LLVM opcode as the second argument

  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  Value *VarID = ConstantInt::get(Int32Type, getRegisterID(CI));
  auto arg2 =  ConstantInt::get(Int32Type,CI->getPredicate());
  std::vector<Value *> Args = {VarID,arg2};
  auto Func = Mod->getFunction(DSE_ICMP_FUNCTION_NAME);
  CallInst::Create(Func, Args, "", CI);
}

/**
 * @brief Instrument Branch Instructions.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param BI Instrumentation location
 */
void instrumentBranch(Module *Mod, BranchInst *BI) {
  //condition value true/false
  //  Mod->getOrInsertFunction(DSE_BRANCH_FUNCTION_NAME, VoidType, Int32Type, Int32Type, Int1Type);
  //__DSE_Branch__(int BID, int RID, int B) 
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  auto Func = Mod->getFunction(DSE_BRANCH_FUNCTION_NAME);
  auto RID = ConstantInt::get(Int32Type, getRegisterID(BI->getCondition())); //what is the register ID? register ID of the register that stores the condition of the branch
  auto BID = ConstantInt::get(Int32Type, getBranchID(BI));
  auto B = BI->getCondition(); //Usually a Int1type do not need to parse  conditon-> operand
  std::vector<Value *> Args = {BID, RID, B};
  CallInst::Create(Func,Args,"",BI);

}

/**
 * @brief Instrument BinaryOperator.
 *
 * TODO: Implement this.
 *
 * @param Mod Current Module
 * @param BO Instrumentation location
 */
void instrumentBinOp(Module *Mod, BinaryOperator *BO) {
  //Mod->getOrInsertFunction(DSE_BINOP_FUNCTION_NAME, VoidType, Int32Type, Int32Type);
  //How would I tell passing address or ID?
  /* @param R Address of Binary Operation result. Is this ID or just pass the instruction? Or the same?
 * @param Op Operator Kind
 * extern "C" void __DSE_BinOp__(int R, int Op)
 */
  auto &Context = Mod->getContext();
  auto *Int32Type = Type::getInt32Ty(Context);
  auto Func = Mod->getFunction(DSE_BINOP_FUNCTION_NAME);
  auto R = ConstantInt::get(Int32Type, getRegisterID(BO));
  auto Op = ConstantInt::get(Int32Type,BO->getOpcode()); //return value is int in C need to parce to Int32Type
  //if the function is a value then you dont need to parse it to int32 int. 
  std::vector<Value *> Args = {R, Op};
  CallInst::Create(Func,Args,"",BO);

}

/**
 * @brief Instrument Instructions.
 *
 * TODO: Implement this.
 *
 * Hint: Make sure to instrument all the Values
 *       used by an instruction so that they are available
 *       to the DSE Engine.
 *
 * @param Mod Current Module
 * @param I Instruction to Instrument
 */
void instrument(Module *Mod, Instruction *I) {
  if (AllocaInst *AI = dyn_cast<AllocaInst>(I)) {
    // TODO: Implement.
    instrumentAlloca(Mod,AI);
  } else if (StoreInst *SI = dyn_cast<StoreInst>(I)) {
    // TODO: Implement.
    //if Value is int:
    auto Value = SI->getValueOperand();
    instrumentValue(Mod,Value,SI);
    instrumentStore(Mod,SI);
  } else if (LoadInst *LI = dyn_cast<LoadInst>(I)) {
    instrumentLoad(Mod, LI);
    // TODO: Implement.
  } else if (ICmpInst *CI = dyn_cast<ICmpInst>(I)) {
    // TODO: Implement.
    auto arg1 = CI->getOperand(0); //first operand in the instruction
    auto arg2 = CI->getOperand(1); //second operand in the instruction
    //instrument those separately
    instrumentValue(Mod,arg1,CI);
    instrumentValue(Mod,arg2,CI);
    instrumentICmp(Mod,CI);//instrument the cmp% istructin itself along with the predicate

  } else if (BranchInst *BI = dyn_cast<BranchInst>(I)) {
    if (BI->isUnconditional())
      return;
    // TODO: Implement.
    //out value
    auto val = BI->getCondition();
    instrumentValue(Mod,val,BI);
    instrumentBranch(Mod,BI);
  } else if (BinaryOperator *BO = dyn_cast<BinaryOperator>(I)) {
    // TODO: Implement.
    auto arg1 = BO->getOperand(0); //first operand in the instruction
    auto arg2 = BO->getOperand(1); //second operand in the instruction
    //instrument those separately
    instrumentValue(Mod,arg1,BO);
    instrumentValue(Mod,arg2,BO);
    instrumentBinOp(Mod,BO);//instrument the cmp% istructin itself along with the predicate
  }
}

bool DSEInstrument::runOnFunction(Function &F) {
  LLVMContext &Context = F.getContext();
  Module *Mod = F.getParent();

  Type *VoidType = Type::getVoidTy(Context);
  Type *Int1Type = Type::getInt1Ty(Context);
  auto *Int32Type = Type::getInt32Ty(Context);
  Type *Int32PtrType = Type::getInt32PtrTy(Context);

  // Insert all the DSE function declarations into Module.
  Mod->getOrInsertFunction(DSE_INIT_FUNCTION_NAME, VoidType);
  Mod->getOrInsertFunction(DSE_ALLOCA_FUNCTION_NAME, VoidType, Int32Type, Int32PtrType);
  Mod->getOrInsertFunction(DSE_STORE_FUNCTION_NAME, VoidType, Int32PtrType);
  Mod->getOrInsertFunction(DSE_LOAD_FUNCTION_NAME, VoidType, Int32Type, Int32PtrType);
  Mod->getOrInsertFunction(DSE_CONST_FUNCTION_NAME, VoidType, Int32Type);
  Mod->getOrInsertFunction(DSE_REGISTER_FUNCTION_NAME, VoidType, Int32Type);
  Mod->getOrInsertFunction(DSE_ICMP_FUNCTION_NAME, VoidType, Int32Type, Int32Type);
  Mod->getOrInsertFunction(DSE_BRANCH_FUNCTION_NAME, VoidType, Int32Type, Int32Type, Int1Type);
  Mod->getOrInsertFunction(DSE_BINOP_FUNCTION_NAME, VoidType, Int32Type, Int32Type);

  if (F.getName().equals("main")) {
    // TODO: Initilize the DSE Engine
    auto &I =  *inst_begin(F);
    instrumentDSEInit(Mod, F, I);
  }

  // Instrument each instruction
  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    instrument(Mod, &*I);
  }
  return true;
}

char DSEInstrument::ID = 1;
static RegisterPass<DSEInstrument>
    X("DSEInstrument", "Instrumentations for Dynamic Symbolic Execution", false,
      false);

} // namespace dse
