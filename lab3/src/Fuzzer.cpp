/**
 * NOTE: You should feel free to manipulate any content in this .cpp file.
 * This means that if you want you can change almost everything,
 * as long as the fuzzer runs with the same cli interface.
 * This also means that if you're happy with some of the provided default
 * implementation, you don't have to modify it.
 */

#include <cstdlib>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#include <cstdio>
#include <cstring>
#include <string>

#include "Utils.h"

#define ARG_EXIST_CHECK(Name, Arg)                                             \
  {                                                                            \
    struct stat Buffer;                                                        \
    if (stat(Arg, &Buffer)) {                                                  \
      fprintf(stderr, "%s not found\n", Arg);                                  \
      return 1;                                                                \
    }                                                                          \
  }                                                                            \
  std::string Name(Arg);

#define DBG                                                                    \
  std::cout << "Hit F::" << __FILE__ << " ::L" << __LINE__ << std::endl

/**
 * @brief Type Signature of Mutation Function.
 * MutationFn takes a string as input and returns a string.
 *
 * MutationFn: string -> string
 */
typedef std::string MutationFn(std::string);

/**
 * Struct that holds useful information about
 * one run of the program.
 *
 * @param Passed       did the program run without crashing?
 * @param Mutation     mutation function used for this run.
 * @param Input        parent input used for generating input for this run.
 * @param MutatedInput input string for this run.
 */
struct RunInfo {
  bool Passed;
  MutationFn *Mutation;
  std::string Input, MutatedInput;
};

/************************************************/
/*            Global state variables            */
/************************************************/
/**
 * Note: Feel free to add/remove/change any of the following variables.
 * Depending on what you want to keep track of during fuzzing.
 */
// Collection of strings used to generate inputs
std::vector<std::string> SeedInputs;
// Add some mutated string that are not the best coverage one
std::vector<std::string> Candidates; 
// Variable to store coverage related information.
std::vector<std::string> CoverageState;

// Coverage related information from previous step.
std::vector<std::string> PrevCoverageState;

/**
 * @brief Variable to keep track of some Mutation related state.
 * Feel free to change/ignore this if you want to.
 */
int MutationState = -1; //var that checks if current mutation causes improvement
int MutationIndex = -1; //var that records current mutation index in MutationFns
std::string BestInputSoFar=""; //store the best input so far(most coverage)
std::string BestMutatedInputSoFar=""; //store the best mutated input
int MaxCoverage = 0; //record max coverage number
/**
 * @brief Variable to keep track of some state related to strategy selection.
 * Feel free to change/ignore this if you want to.
 */
int StrategyState = -1; //var that describe the input index
int StrategyIndex = -1; //store last good input index
int InputCounter = 0;
int MutationCounter = 0;
/************************************************/
/*    Implement your select input algorithm     */
/************************************************/

/**
 * @brief Select a string that will be mutated to generate a new input.
 * Sample code picks the first input string from SeedInputs.
 *
 * TODO: Implement your logic for selecting a input to mutate.
 * If you require, you can use the Info variable to help make a
 * decision while selecting a Seed but it is not necessary for the lab.
 *
 * @param RunInfo struct with information about the previous run.
 * @return Pointer to a string.
 */
std::string selectInput(RunInfo Info) {
  int length = SeedInputs.size();
  int Index = rand() % length;
  if(InputCounter==0){
    int luck = rand() % 3;
    if(luck ==0) return SeedInputs[length-1];
  }
  if(InputCounter>10){
    int luck = rand() % 3;
    if(luck == 0 && Candidates.size()>1) 
    return Candidates[rand() %Candidates.size()];
  }
  
  if(StrategyState!=-1 && StrategyIndex!=-1){
    while(Index == StrategyState){
      Index = rand() % length;
    }
  }
  StrategyIndex = Index;
  int LetGodDecide =rand() %5;
  if(LetGodDecide==0) return SeedInputs[Index];
  if(LetGodDecide==1) return BestInputSoFar;
  
  return BestMutatedInputSoFar;
}

/*********************************************/
/*       Implement mutation startegies       */
/*********************************************/

/**
 * Here we provide a two sample mutation functions
 * that take as input a string and returns a string.
 */

/**
 * @brief Mutation Strategy that does nothing.
 *
 * @param Original Original input string.
 * @return std::string mutated string.
 */
std::string mutationA(std::string Original) { return Original; }

/**
 * @brief Mutation Strategy that inserts a random
 * alpha numeric char at a random location in Original.
 *
 * @param Original Original input string.
 * @return std::string mutated string.
 */
std::string mutationB(std::string Original) {
  if (Original.length() <= 0)
    return Original;

  int Index = rand() % Original.length();
  int randomASCII = rand() % 128;
  char c = '\0' + randomASCII;
  return Original.insert(Index, 1, c);
}

/**
 * TODO: Add your own mutation functions below.
 * Make sure to update the MutationFns vector to include your functions.
 *
 * Some ideas: swap adjacent chars, increment/decrement a char.
 *
 * Get creative with your strategies.
 */
/**
* @brief Mutation Strategy that changes a random char of Original string
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationC(std::string Original){
  if (Original.length() <= 0)
    return Original;
  int randomASCII = rand() % 128;
  char c = '\0' + randomASCII;
  int randomIndex = rand() % Original.length();
  Original[randomIndex] = c;
  return Original;
}
/**
*@brief double input size
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationD(std::string Original){
  if (Original.length() <= 0)
    return Original;
  return Original+Original;
}

/**
*@brief half input size
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationE(std::string Original){
  if (Original.length() <= 0)
    return Original;
  return Original.substr(0,Original.size()/2);
}


/**
*@brief force \n
* @param Original Original input string.
* @return "\n".
*/
std::string mutationF(std::string Original){
  return "\n";
}

/**
*@brief force NULL
*/
std::string mutationG(std::string Original){
  return "\0";
}

/**
*@brief Swap adjacent bytes
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationH(std::string Original){
  if (Original.length() <= 1)
    return mutationC(Original);
  int randomIndex = rand() % (Original.length()-1);
  char c = Original[randomIndex];
  Original[randomIndex] = Original[randomIndex+1];
  Original[randomIndex+1]=c; 
  return Original;
}

/**
*@brief Remove a random byte
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationI(std::string Original){
  if (Original.length() <= 1)
    return mutationC(Original);
  int randomIndex = rand() % (Original.length());
  Original.erase(randomIndex,1);
  return Original;
}

/**
*@brief Swap firstHalf with SecondHalf
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationJ(std::string Original){
  if (Original.length() <= 2)
    return mutationC(Original);
  int len = Original.length();
  std::string firstHalf= Original.substr(0,len/2);
  std::string secondHalf= Original.substr(len/2,len);
  return secondHalf+firstHalf;
}



/**
*@brief increase input size by random size and random characters
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutationN(std::string Original){
  int randomIndex  = rand() % 300+1;
 for(int i =0; i<randomIndex;i++){
    int randomASCII = rand() % 128;
    char c = '\0' + randomASCII;
    Original.push_back(c);
 }
 return Original;
}


/**
*@brief Cycle through and change every letter
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation1(std::string Original){
  if (Original.length() <= 0)
    return Original;
 for(int i =0; i<Original.length();i++){
    int randomASCII = rand() % 128;
    char c = '\0' + randomASCII;
    if(Original[i]!='\n')
    Original[i] = c;
 }
 return Original;
}

/**
*@brief insert '\n' to random positions
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation2(std::string Original){
 int times = rand() % 5 +2;
 for(int i =0; i<times; i++){
  int randIndex = rand() % Original.length();

    Original=Original.substr(0,randIndex)+"\n"+Original.substr(randIndex, Original.length());
  
 }
 return Original;
}

/**
*@brief decrease input size by random size and random characters
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation3(std::string Original){
  int randomIndex  = rand() % Original.length();
 for(int i =0; i<randomIndex;i++){
    int randomASCII = rand() % 128;
    char c = '\0' + randomASCII;
    Original[i]=c;
 }
 return Original.substr(0,randomIndex);
}

/**
*@brief randomly change characters not \n or \0 in given string
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation4(std::string Original){
  int randomIndex  = rand() % Original.length();
 for(int i =0; i<randomIndex;i++){
    int randomASCII = rand() % 128;
    char c = '\0' + randomASCII;
    if(Original[i]!='\n' && Original[i]!='\0') Original[i]=c;
    
 }
 return Original;
}

/**
*@brief  change the whole string to a random character and skip \n and \0
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation5(std::string Original){ 
  int randomASCII = rand() % 128;
  char c = '\0' + randomASCII;
 for(int i =0; i<Original.length();i++){
   
    if(Original[i]!='\n' && Original[i]!='\0') Original[i]=c;
    
 }
 return Original;
}

/**
*@brief  make all elements distinct
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation6(std::string Original){ 
  if(Original.length()>128) return Original;
  int startIdx = rand() % 128;
  for(int i=0; i<Original.length();i++){
    Original[i]='\0'+(i+startIdx)%128;
  }
  return Original;
}

/**
*@brief  chang0e the whole string to a random character and not skip \n and \
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation7(std::string Original){ 
  int randomASCII = rand() % 128;
  char c = '\0' + randomASCII;
 for(int i =0; i<Original.length();i++){
   Original[i]=c;}
  return Original;
}

/**
*@brief  random sequence to idential ASCII letters
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation8(std::string Original){ 
  if(Original.length()<=1) return Original;
  int randomASCII = rand() % 128;
  char c = '\0' + randomASCII;
  int times = rand() % 5;
  while(times>=0){
    int startIdx = rand() % Original.length();
    int length = rand() % Original.length();
    while(length<Original.length()){
      Original[length]=c;
      length++;
    }
    times--;
  }
  return Original;
}


/**
*@brief  change random number of chars to random ASCII char
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation9(std::string Original){ 
  if(Original.length()<=1) return Original;
  
  int times = rand() % Original.length();
  while(times>=0){
    int randomASCII = rand() % 128;
    char c = '\0' + randomASCII;
    int idx = rand() % Original.length();
    Original[idx]=c;
    times--;
  }
  return Original;
}

/**
*@brief  add \n to the end
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation10(std::string Original){ 
  
  return Original+"\n";
}

/**
*@brief  random shuffle String 
* @param Original Original input string.
* @return std::string mutated string.
*/
std::string mutation11(std::string Original){ 
  random_shuffle(Original.begin(),Original.end());
  return Original+"\n";
}


/**
*@brief decrease input size by random size and random characters
* @param Original Original input string.
* @return std::string mutated string.
*/

// std::vector<MutationFn *> MutationFnsWithoutRepeat = {mutationA, mutationB,mutationC,mutationD,mutationE,mutationF,mutationG,mutationH,mutationI,mutationJ,mutation1,mutationN,mutation2,mutation3,mutation4,mutation5};

// /**
// *@brief ran a random mutation three times
// * @param Original Original input string.
// * @return std::string mutated string.
// */
// std::string mutationK(std::string Original){
//   if (Original.length() <= 2)
//     return mutationC(Original);
//   int len = MutationFnsWithoutRepeat.size();
//   int idx = rand() %len;
//   Original=MutationFnsWithoutRepeat[idx](Original);
//   Original=MutationFnsWithoutRepeat[idx](Original);
//   return Original;
// }

/**
 * @brief Select a mutation function to apply to the seed input.
 * Sample code picks a random Strategy.
 *
 * TODO: Add your own logic to select a mutation function from MutationFns.
 * Hint: You may want to make use of any global state you store
 * during feedback to make decisions on what MutationFn to choose.
 *
 * @param RunInfo struct with information about the current run.
 * @returns a pointer to a MutationFn
 */
/**
 * @brief Vector containing all the available mutation functions
 *
 * TODO: Update the definition to include any mutations you implement.
 * For example if you implement mutationC then update it to be:
 * std::vector<MutationFn *> MutationFns = {mutationA, mutationB, mutationC};
 */
std::vector<MutationFn *> MutationFns = {mutationA, mutationB,mutationC,mutationD,mutationE,mutationF,mutationG,mutationH,mutationI,mutationJ,mutation1,mutationN,mutation2,mutation3,mutation4,mutation5,mutation6,mutation7,mutation8,mutation9,mutation10,mutation11};
MutationFn *selectMutationFn(RunInfo &Info) {
  int Strat = rand() % MutationFns.size();
  //  if(MutationCounter==0){
  //   int meantToBe = rand() % 2;
  //   if(meantToBe==1){return MutationFns[MutationFns.size()-1];}
  // }
  
  if(MutationState!=-1 && MutationIndex!=-1){
    while(MutationFns[Strat] == MutationFns[MutationState]){
      Strat = rand() % MutationFns.size();
    }
  }
  MutationIndex = Strat;
  return MutationFns[Strat];
}

/*********************************************/
/*     Implement your feedback algorithm     */
/*********************************************/
/**
 * Update the internal state of the fuzzer using coverage feedback.
 *
 * @param Target name of target binary
 * @param Info RunInfo
 */
void feedBack(std::string &Target, RunInfo &Info) {
  std::vector<std::string> RawCoverageData;
  readCoverageFile(Target, RawCoverageData);
  PrevCoverageState = CoverageState;

  //int currenmtCovLength = PrevCoverageState.size();
  CoverageState.clear();

  /**
   * TODO: Implement your logic to use the coverage information from the test
   * phase to guide fuzzing. The sky is the limit!
   *
   * Hint: You want to rely on some amount of randomness to make decisions.
   *
   * You have the Coverage information of the previous test in
   * PrevCoverageState. And the raw coverage data is loaded into RawCoverageData
   * from the Target.cov file. You can either use this raw data directly or
   * process it (not-necessary). If you do some processing, make sure to update
   * CoverageState to make it available in the next call to feedback.
   */
  CoverageState.assign(RawCoverageData.begin(),
                       RawCoverageData.end()); // No extra processing
  if(CoverageState.size()>PrevCoverageState.size()){
    Candidates.push_back(Info.MutatedInput);
    if(CoverageState.size()>MaxCoverage){
      MaxCoverage=CoverageState.size();
      BestMutatedInputSoFar = Info.MutatedInput;
      BestInputSoFar = Info.Input;
    }
    
    //MutationFns.push_back(Info.Mutation);
    MutationState =-1;
    InputCounter=0;
    MutationCounter=0;
    
  }
  else{
    if(Info.Passed){
    int LetGodDecide = rand()%3;
    MutationCounter++;
    MutationState =MutationIndex;
    //SeedInputs.push_back(Info.MutatedInput);
  }
  }
 
  if(!Info.Passed){
    BestMutatedInputSoFar = Info.MutatedInput;
    BestInputSoFar = Info.Input;
  }

}

int Freq = 1;
int Count = 0;
int PassCount = 0;

bool test(std::string &Target, std::string &Input, std::string &OutDir) {
  // Clean up old coverage file before running
  std::string CoveragePath = Target + ".cov";
  std::remove(CoveragePath.c_str());

  ++Count;
  int ReturnCode = runTarget(Target, Input);
  if (ReturnCode == 127) {
    fprintf(stderr, "%s not found\n", Target.c_str());
    exit(1);
  }
  
  fprintf(stderr, "\e[A\rTried %d inputs, %d crashes found\n", Count,
          failureCount);
  if (ReturnCode == 0) {
    if (PassCount++ % Freq == 0)
      storePassingInput(Input, OutDir);
    return true;
  } else {
    storeCrashingInput(Input, OutDir);
    return false;
  }
}

/**
 * @brief Fuzz the Target program and store the results to OutDir
 *
 * @param Target Target (instrumented) program binary.
 * @param OutDir Directory to store fuzzing results.
 */
void fuzz(std::string Target, std::string OutDir) {
  struct RunInfo Info;
  while (true) {
    std::string Input = selectInput(Info);
    Info = RunInfo();
    Info.Input = Input;
    Info.Mutation = selectMutationFn(Info);
    Info.MutatedInput = Info.Mutation(Info.Input);
    Info.Passed = test(Target, Info.MutatedInput, OutDir);
    feedBack(Target, Info);
  }
}

/**
 * Usage:
 * ./fuzzer [target] [seed input dir] [output dir] [frequency] [random seed]
 */
int main(int argc, char **argv) {
  if (argc < 4) {
    printf("usage %s [target] [seed input dir] [output dir] [frequency "
           "(optional)] [seed (optional arg)]\n",
           argv[0]);
    return 1;
  }

  ARG_EXIST_CHECK(Target, argv[1]);
  ARG_EXIST_CHECK(SeedInputDir, argv[2]);
  ARG_EXIST_CHECK(OutDir, argv[3]);

  if (argc >= 5)
    Freq = strtol(argv[4], NULL, 10);

  int RandomSeed = argc > 5 ? strtol(argv[5], NULL, 10) : (int)time(NULL);

  srand(RandomSeed);
  storeSeed(OutDir, RandomSeed);
  initialize(OutDir);

  if (readSeedInputs(SeedInputs, SeedInputDir)) {
    fprintf(stderr, "Cannot read seed input directory\n");
    return 1;
  }
  fprintf(stderr, "Fuzzing %s...\n\n", Target.c_str());
  fuzz(Target, OutDir);
  return 0;
}