#include "DivZeroAnalysis.h"
#include "Utils.h"

namespace dataflow {

/**
 * @brief Get the Predecessors of a given instruction in the control-flow graph.
 *
 * @param Inst The instruction to get the predecessors of.
 * @return Vector of all predecessors of Inst.
 */
std::vector<Instruction *> getPredecessors(Instruction *Inst) {
  std::vector<Instruction *> Ret;
  auto Block = Inst->getParent();
  for (auto Iter = Block->rbegin(), End = Block->rend(); Iter != End; ++Iter) {
    if (&(*Iter) == Inst) {
      ++Iter;
      if (Iter != End) {
        Ret.push_back(&(*Iter));
        return Ret;
      }
      for (auto Pre = pred_begin(Block), BE = pred_end(Block); Pre != BE;
           ++Pre) {
        Ret.push_back(&(*((*Pre)->rbegin())));
      }
      return Ret;
    }
  }
  return Ret;
}

/**
 * @brief Get the successors of a given instruction in the control-flow graph.
 *
 * @param Inst The instruction to get the successors of.
 * @return Vector of all successors of Inst.
 */
std::vector<Instruction *> getSuccessors(Instruction *Inst) {
  std::vector<Instruction *> Ret;
  auto Block = Inst->getParent();
  for (auto Iter = Block->begin(), End = Block->end(); Iter != End; ++Iter) {
    if (&(*Iter) == Inst) {
      ++Iter;
      if (Iter != End) {
        Ret.push_back(&(*Iter));
        return Ret;
      }
      for (auto Succ = succ_begin(Block), BS = succ_end(Block);
           Succ != BS; ++Succ) {
        Ret.push_back(&(*((*Succ)->begin())));
      }
      return Ret;
    }
  }
  return Ret;
}

/**
 * @brief Joins two Memory objects (Mem1 and Mem2), accounting for Domain
 * values.
 *
 * @param Mem1 First memory.
 * @param Mem2 Second memory.
 * @return The joined memory.
 */
Memory *join(Memory *Mem1, Memory *Mem2) {
  /**
   * TODO: Write your code that joins two memories.
   *
   * If some instruction with domain D is either in Mem1 or Mem2, but not in
   *   both, add it with domain D to the Result.
   * If some instruction is present in Mem1 with domain D1 and in Mem2 with
   *   domain D2, then Domain::join D1 and D2 to find the new domain D,
   *   and add instruction I with domain D to the Result.
   */
  //what if they are empty?
  
  auto res = new Memory(*Mem2);
  for (auto Iter = Mem1->begin(); Iter != Mem1->end();  ++Iter) {

    auto key = (*Iter).first;
    auto mem1val = (*Iter).second;
    auto domain = new Domain(mem1val->Value);
    const auto It = res->find(key);
    //the key is not in Mem2
    if (It == res->end()) domain = Domain::join(domain, new Domain(Domain::Element::Uninit));
    //the key is also in Mem2
    else domain = Domain::join(mem1val,It->second);

    
    res->insert({key,domain});
  }
   
  return res;
}

void DivZeroAnalysis::flowIn(Instruction *Inst, Memory *InMem) {
  /**
   * TODO: Write your code to implement flowIn.
   *
   * For each predecessor Pred of instruction Inst, do the following:
   *   + Get the Out Memory of Pred using OutMap.
   *   + Join the Out Memory with InMem.
   */
  auto preds = getPredecessors(Inst);
  auto mem =  new Memory();
  for(auto & pred: preds){
    auto mem1 = OutMap[pred];
    mem=join(mem1, mem);
  }
  for(auto & s: *mem){
    
    (*InMem)[s.first]=s.second;
    
  }\
  //do I need to join this?
  // InMap[Inst] =InMem;
  // errs() <<"Insturction is :"<< *Inst <<"\n";
  // printMemory(InMap[Inst]);
  // getchar();
  
}

/**
 * @brief This function returns true if the two memories Mem1 and Mem2 are
 * equal.
 *
 * @param Mem1 First memory
 * @param Mem2 Second memory
 * @return true if the two memories are equal, false otherwise.
 */
bool equal(Memory *Mem1, Memory *Mem2) {

  /**
   * TODO: Write your code to implement check for equality of two memories.
   *
   * If any instruction I is present in one of Mem1 or Mem2,
   *   but not in both and the Domain of I is not UnInit, the memories are
   *   unequal.
   * If any instruction I is present in Mem1 with domain D1 and in Mem2
   *   with domain D2, if D1 and D2 are unequal, then the memories are unequal.
   */
  //check if all keys in mem1 also in mem2
  for(auto Iter=Mem1->begin(); Iter!=Mem1->end(); Iter++){
    auto key = Iter->first;
    auto domain1 = Iter->second;
    //if the key is not in the other Mem and it is not uninit then return false
    if((Mem2->count(key))<=0 && domain1->Value!=Domain::Element::Uninit) return false;
    else{
      auto domain2 = (*Mem2)[key];
      if(!(Domain::equal(*domain1,*domain2))) return false;
    }
  }
  //check if all keys in mem2 also in mem1
  for(auto Iter=Mem2->begin(); Iter!=Mem2->end(); Iter++){
    auto key = Iter->first;
    auto domain1 = Iter->second;
    //if the key is not in the other Mem and it is not uninit then return false
    if((Mem1->count(key))<=0 && domain1->Value!=Domain::Element::Uninit ) return false;
    else{
        auto domain2 = (*Mem2)[key];
        if(!(Domain::equal(*domain1,*domain2))) return false;
    }
  }
  
  //passed all tests return true.
  return true;
}

void DivZeroAnalysis::flowOut(Instruction *Inst, Memory *Pre, Memory *Post,
                              SetVector<Instruction *> &WorkSet) {
  /**
   * TODO: Write your code to implement flowOut.
   *
   * For each given instruction, merge abstract domain from pre-transfer memory
   * and post-transfer memory, and update the OutMap.
   * If the OutMap changed then also update? the WorkSet.
   */
  //pre is the outmap before modify last transfercall
  //post is the updated inmap with transfer going to become the new outmap. whatever comes out of transfer function
  //check if pre == post 

  if(!equal(Pre,Post)){
    Pre->clear();
    for(auto & s: *Post){
      Pre->insert(s);
    }
    //visit all successors of that instruction
    //add my successors to the workset to makesure they are visited again.
    //add to work set.
    //how to update workset?
    //WorkSet.insert(Inst); don't need because this is up to date.
    auto successors = getSuccessors(Inst);
    for( auto & successor:successors){
    WorkSet.insert(successor);
    }
  }
  
}

void DivZeroAnalysis::doAnalysis(Function &F) {
  SetVector<Instruction *> WorkSet;
  /**
   * TODO: Write your code to implement the chaotic iteration algorithm
   * for the analysis.
   *
   * Initialize the WorkSet with all the instructions in the function.
   *
   * While the WorkSet is not empty:
   * - Pop an instruction from the WorkSet.
   * - Construct it's Incoming Memory using flowIn.
   * - Evaluate the instruction using transfer and create the OutMemory.
   * call transfer create the map and pass reference to transfer, make a copy of inmap and pass in , bc you dont want to change.
   * - Use flowOut along with the previous Out memory and the current Out
   *   memory, to check if there is a difference between the two to update the
   *   OutMap and add all successors to WorkSet.
   */
  //Initialize the WorkSet with all the instructions in the function.
  for(inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
    WorkSet.insert(&(*I));
  }
  
  while(!WorkSet.empty()){
    //pop inst 
    //if I use the iterator, should never update the object
    Instruction* Inst = WorkSet.front();
    auto in =InMap[Inst];
    flowIn(Inst,in);    
    auto newOutMem= new Memory(*in); //put on HEAP
    transfer(Inst, in, *newOutMem); //will modify newOut
    flowOut(Inst,OutMap[Inst],newOutMem,WorkSet);//when I flow out , comparing outmap of that inst before what I have done to the instruction
    WorkSet.remove(Inst);
  }

}

} // namespace dataflow