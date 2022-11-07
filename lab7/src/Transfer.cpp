#include "DivZeroAnalysis.h"
#include "Utils.h"

namespace dataflow
{

  /**
   * @brief Is the given instruction a user input?
   *
   * @param Inst The instruction to check.
   * @return true If it is a user input, false otherwise.
   */
  bool isInput(Instruction *Inst)
  {
    if (auto Call = dyn_cast<CallInst>(Inst))
    {
      if (auto Fun = Call->getCalledFunction())
      {
        return (Fun->getName().equals("getchar") ||
                Fun->getName().equals("fgetc"));
      }
    }
    return false;
  }

  /**
   * Evaluate a PHINode to get its Domain.
   *
   * @param Phi PHINode to evaluate
   * @param InMem InMemory of Phi
   * @return Domain of Phi
   */
  Domain *eval(PHINode *Phi, const Memory *InMem)
  {
    if (auto ConstantVal = Phi->hasConstantValue())
    {
      return new Domain(extractFromValue(ConstantVal));
    }

    Domain *Joined = new Domain(Domain::Uninit);

    for (unsigned int i = 0; i < Phi->getNumIncomingValues(); i++)
    {
      auto Dom = getOrExtract(InMem, Phi->getIncomingValue(i));
      Joined = Domain::join(Joined, Dom);
    }
    return Joined;
  }

  /**
   * @brief Evaluate the +, -, * and / BinaryOperator instructions
   * using the Domain of its operands and return the Domain of the result.
   *
   * @param BinOp BinaryOperator to evaluate
   * @param InMem InMemory of BinOp
   * @return Domain of BinOp
   */
  Domain *eval(BinaryOperator *BinOp, const Memory *InMem)
  {
    /**
     * TODO: Write your code here that evaluates +, -, * and /
     * based on the Domains of the operands.
     */
    auto Operator = BinOp->getOpcode();
    // get first Operand
    auto op1 = BinOp->getOperand(0);
    // domain of op1
    auto domain1 = getOrExtract(InMem, op1);
    ;
    // x + 2
    // get second Operand
    auto op2 = BinOp->getOperand(1);
    // domain of op2
    auto domain2 = getOrExtract(InMem, op2);
    switch (Operator)
    {
    //+
    case Instruction::Add:
    case Instruction::FAdd:
      return Domain::add(domain1, domain2);
    //-
    case Instruction::Sub:
    case Instruction::FSub:
      return Domain::sub(domain1, domain2);
    //*
    case Instruction::Mul:
    case Instruction::FMul:
      return Domain::mul(domain1, domain2);
    //
    case Instruction::UDiv:
    case Instruction::SDiv:
    case Instruction::FDiv:
      return Domain::div(domain1, domain2);
    }
  }

  /**
   * @brief Evaluate Cast instructions.
   *
   * @param Cast Cast instruction to evaluate
   * @param InMem InMemory of Instruction
   * @return Domain of Cast
   */
  Domain *eval(CastInst *Cast, const Memory *InMem)
  {
    /**
     * TODO: Write your code here to evaluate Cast instruction.
     */
    return getOrExtract(InMem, Cast->getOperand(0));
  }

  /**
   * @brief Evaluate the ==, !=, <, <=, >=, and > Comparision operators using
   * the Domain of its operands to compute the Domain of the result.
   *
   * @param Cmp Comparision instruction to evaluate
   * @param InMem InMemory of Cmp
   * @return Domain of Cmp
   */
  Domain *eval(CmpInst *Cmp, const Memory *InMem)
  {
    /**
     * TODO: Write your code here that evaluates:
     * ==, !=, <, <=, >=, and > based on the Domains of the operands.
     *
     * NOTE: There is a lot of scope for refining this, but you can just return
     * MaybeZero for comparisons other than equality.
     */
    // last project we did not care about ><, do we care about them in this project?
    auto op1 = Cmp->getOperand(0);
    auto op2 = Cmp->getOperand(1);
    auto domain1 = getOrExtract(InMem, op1);
    auto domain2 = getOrExtract(InMem, op2);
    if (Cmp->isEquality())
    {
      //>= <= == non0!=non0->maybe0
      // anyone uinit-> unint
      auto predicate = Cmp->getPredicate();
      // three possible domain cases:
      auto maybe0 = new Domain(Domain::MaybeZero);
      auto zero = new Domain(Domain::Zero);
      auto non0 = new Domain(Domain::NonZero);

      switch (predicate)
      {
      case llvm::CmpInst::ICMP_NE:
        // 1 0!=0, false, 0
        // 2 0!=maybe0, maybe0
        // 3 0!=non0, true, non0
        // 4 maybe0!=0, maybe0
        // 5 maybe0 != maybe0,maybe0
        // 6 maybe0 !=non0,maybe0
        // 7 non0!=0 true, non0
        // 8 non0!=maybe0, maybe0
        // 9 non0!=non0, maybe0
        if (Domain::equal(*domain1, *zero))
        {
          // case 1
          if (Domain::equal(*domain2, *zero))
            return zero;
          // case 3
          if (Domain::equal(*domain2, *non0))
            return non0;
        }
        if (Domain::equal(*domain2, *zero))
        {
          if ((Domain::equal(*domain1, *non0)))
            return non0;
        }
        return maybe0;
      case llvm::CmpInst::ICMP_EQ:
        // 1 zero == maybezero will be maybezero
        // 2 zero == non zero will be zero
        // 3 zero == zero will be nonZero
        // 4 maybezero == nonzero will be maybezero
        // 5 maybezero==maybezero will be maybezero
        // 6 mayberzero==zero, maybezero
        // 7 nonzero==nonzero, maybezero
        // 8 nonzero==zero, nonzero
        // 9 nonzero==maybeozero,maybezero
        // so all maybe zero case will be covered in default, we will manually cover for the non-maybezero cases
        if (Domain::equal(*domain1, *zero) || Domain::equal(*domain2, *zero))
        {
          // if domain 1 is 0
          if (Domain::equal(*domain1, *zero))
          {
            // case 2
            if (Domain::equal(*domain2, *zero))
              return non0;
            // case 3
            if (Domain::equal(*domain2, *non0))
              return zero;
          }
          if (Domain::equal(*domain2, *zero))
          {
            // case 8
            if (Domain::equal(*domain1, *non0))
              return zero;
          }
        } // end domain1==0 or domain2==0 case
        // all other cases return maybe0
        return maybe0;
      case llvm::CmpInst::ICMP_UGE:
        // 1 0>=0, true, 1, nonzero
        // 2 0>= nonZero(unsigned), false, 0,zero
        // 3 0>= maybeZero, maybezero
        // 4 maybezero(unsigned)>=0 true,1, nonzero
        // 5 maybe0 >= maybe0 , maybezero
        // 6 maybe0 >= nonzero, maybezero
        // 7 non0(unsigned) >= 0, true,1, nonzero
        // 8 non0(unsigned) >=maybezero, maybezero
        // 9 non0(unsigned) >=non0, maybezero
        if (Domain::equal(*domain1, *zero))
        {
          // case 1
          if (Domain::equal(*domain2, *zero))
            return non0;
          // case 2
          if (Domain::equal(*domain2, *non0))
            return zero;
        }
        if (Domain::equal(*domain1, *maybe0))
        {
          // case 4
          if (Domain::equal(*domain2, *zero))
            return non0;
        }
        if (Domain::equal(*domain1, *non0))
        {
          // case 7
          if (Domain::equal(*domain2, *zero))
            return non0;
        }
        // all other cases return maybe0
        return maybe0;
      case llvm::CmpInst::ICMP_SGE:
        // 1 0>=0, true, 1, non0
        // 2 0>= nonZero(signed), maybe0
        // 3 0>= maybeZero, maybezero
        // 4 maybezero(signed)>=0, maybe0
        // 5 maybe0 >= maybe0 , maybezero
        // 6 maybe0 >= nonzero, maybezero
        // 7 non0(signed) >= 0, maybe0
        // 8 non0(signed) >=maybezero,maybe0
        // 9 non0(signed) >=non0, maybe0
        // case 1
        if (Domain::equal(*domain2, *zero) && Domain::equal(*domain1, *zero))
        {
          return non0;
        }
        // all other cases return maybe0
        return maybe0;
      case llvm::CmpInst::ICMP_ULE:
        // 1 0<=0, true, 1, non0
        // 2 0<= nonZero(unsigned), true, non0
        // 3 0<= maybeZero, true, non0
        // 4 maybezero(unsigned)<=0, maybe0
        // 5 maybe0 <= maybe0 , maybezero
        // 6 maybe0 <= nonzero, maybezero
        // 7 non0(unsigned) <= 0, false, zero
        // 8 non0(unsigned) <=maybezero,maybe0
        // 9 non0(unsigned) <=non0, maybe0
        if (Domain::equal(*domain1, *zero) || Domain::equal(*domain2, *zero))
        {
          if (Domain::equal(*domain1, *zero))
          {
            // case 1,2,3
            return non0;
          }
          if (Domain::equal(*domain2, *zero))
          {
            // case 7
            if (Domain::equal(*domain1, *non0))
              return zero;
          }
        }
        // all other cases return maybe0
        return maybe0;
      case llvm::CmpInst::ICMP_SLE:
        // 1 0<=0, true, 1, non0
        // 2 0<= nonZero(signed), maybe0
        // 3 0<= maybeZero(signed), maybezero
        // 4 maybezero(signed)<=0, maybe0
        // 5 maybe0(signed) <= maybe0 , maybezero
        // 6 maybe0(signed) <= nonzero, maybezero
        // 7 non0(signed) <= 0, maybe0
        // 8 non0(signed) <=maybezero,maybe0
        // 9 non0(signed) <=non0, maybe0
        // zero zero
        // case 1
        if (Domain::equal(*domain2, *zero) && Domain::equal(*domain1, *zero))
        {
          return non0;
        }
        // all other cases return maybe0
        return maybe0;

      // all other cases return maybe0
      default:
        return maybe0;
      }
    }

    // all other cases return maybe0 if not a CMP operation
    return new Domain(Domain::MaybeZero);
  }

  void DivZeroAnalysis::transfer(Instruction *Inst, const Memory *In,
                                 Memory &NOut, PointerAnalysis *PA,
                                 SetVector<Value *> PointerSet)
  {
    if (isInput(Inst))
    {
      // The instruction is a user controlled input, it can have any value.
      NOut[variable(Inst)] = new Domain(Domain::MaybeZero);
    }
    else if (auto Phi = dyn_cast<PHINode>(Inst))
    {
      // Evaluate PHI node
      NOut[variable(Phi)] = eval(Phi, In);
    }
    else if (auto BinOp = dyn_cast<BinaryOperator>(Inst))
    {
      // Evaluate BinaryOperator
      NOut[variable(BinOp)] = eval(BinOp, In);
    }
    else if (auto Cast = dyn_cast<CastInst>(Inst))
    {
      // Evaluate Cast instruction
      NOut[variable(Cast)] = eval(Cast, In);
    }
    else if (auto Cmp = dyn_cast<CmpInst>(Inst))
    {
      // Evaluate Comparision instruction
      NOut[variable(Cmp)] = eval(Cmp, In);
    }
    else if (auto Alloca = dyn_cast<AllocaInst>(Inst))
    {
      // Do nothing here.
    }
    else if (auto Store = dyn_cast<StoreInst>(Inst))
    {
      /**
       * TODO: Store instruction can either add new variables or overwrite existing variables into memory maps.
       * To update the memory map, we rely on the points-to graph constructed in PointerAnalysis.
       *
       * To build the abstract memory map, you need to ensure all pointer references are in-sync, and
       * will converge upon a precise abstract value. To achieve this, implement the following workflow:
       *
       * Iterate through the provided PointerSet:
       *   - If there is a may-alias (i.e., `alias()` returns true) between two variables:
       *     + Get the abstract values of each variable.
       *     + Join the abstract values using Domain::join().
       *     + Update the memory map for the current assignment with the joined abstract value.
       *     + Update the memory map for all may-alias assignments with the joined abstract value.
       *
       * Hint: You may find getOperand(), getValueOperand(), and getPointerOperand() useful.
       */
      // store i32 0(Value), i32* %a(Pointer), align 4
      auto Value = Store->getValueOperand();     // value which one is pointer which one is value? store i32 0, i32* %a, align 4
      auto Pointer = Store->getPointerOperand(); // pointer
      auto typeOfValue = Value->getType();
      if (!(typeOfValue->isIntegerTy()))
        return;
      auto curPointerString = variable(Pointer); // Do we overwrite?
      auto updatedDomain = getOrExtract(In, Value);
      // Just at this program point the new Domain doninates Pointer regardless any other possible branches
      NOut[curPointerString] = updatedDomain;

      for (auto &I : PointerSet)
      {
        auto mayAliasPointerString = variable(I);
        // if they are may-alias, join their domain
        if (PA->alias(curPointerString, mayAliasPointerString))
        {
          if(curPointerString != mayAliasPointerString){
            NOut[mayAliasPointerString] = Domain::join(updatedDomain, getOrExtract(In, I));
          }
        }
      }

      
    }
    else if (auto Load = dyn_cast<LoadInst>(Inst))
    {
      /**
       * TODO: Rely on the existing variables defined within the `In` memory to
       * know what abstract domain should be for the new variable
       * introduced by a load instruction.
       *
       * If the memory map already contains the variable, propagate the existing
       * abstract value to NOut.
       * Otherwise, initialize the memory map for it. what do you mean? Nout?
       *
       * Hint: You may use getPointerOperand().
       * (Instruction *Inst, const Memory *In,
                                 Memory &NOut, PointerAnalysis *PA,
                                 SetVector<Value *> PointerSet)

       */

      auto pointer = Load->getPointerOperand();
      auto pointerType = Load->getType();
      // we only care integer type here
      if (pointerType->isIntegerTy())
      {
        // default or new map
        NOut[variable(Load)] = getOrExtract(In, pointer);
      }
      /*%1 = load i32*, i32** %d, align 8
        This is loading the value of the pointer at %d (which itself is a pointer) into a new variable %1 of type i32*
        Do we do anything here for this case? Why?
      */
    }
    else if (auto Branch = dyn_cast<BranchInst>(Inst))
    {
      // Analysis is flow-insensitive, so do nothing here.
    }
    else if (auto Call = dyn_cast<CallInst>(Inst))
    {
      /**
       * TODO: Populate the NOut with an appropriate abstract domain.
       *
       * You only need to consider calls with int return type.
       */
      //  %call = call i32 @getchar() but no return value defined here yet. Later store instruction will cover the domain, I guess we just initialize here
      // But do we really need to do anything?
      // the only thing I think worth to do is to reset the Domain, at least the OutMap will now be different
      NOut[variable(Inst)] = new Domain();
    }
    else if (auto Return = dyn_cast<ReturnInst>(Inst))
    {
      // Analysis is intra-procedural, so do nothing here.
    }
    else
    {
      errs() << "Unhandled instruction: " << *Inst << "\n";
    }
  }

} // namespace dataflow