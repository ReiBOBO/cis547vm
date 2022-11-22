#include "Strategy.h"
#include <set>

/*******************************************************
 * NOTE: You are free to edit this file as you see fit *
 *******************************************************/

/**
 * Strategy to explore various paths of execution.
 *
 * TODO: Implement your search strategy.
 *
 * @param OldVec Vector of Z3 expressions.
 */
std::set<z3::expr> visited;
void searchStrategy(z3::expr_vector &OldVec) {
    //stack of expressions
    //operator to change it !E
    //two ways simple will work: most of points
    //more safiscately dfs
    //global tracking braches static variable.
    //visited set counting DFS
    //if OldVec is now empty, return
    // while (!OldVec.empty()){
        // std::cout<<"New iteration: Set of OIdVec: ";
        // for (auto const &exp: OldVec){
        //     std::cout<<exp<<","<<std::endl;
        // }
        // std::cout<<"Set of Visited: ";
        // for (auto const &exp: visited){
        //     std::cout<<exp<<","<<std::endl;
        // }
        z3::expr SE = OldVec.back();
        z3::expr negatedSE = (!SE);
        OldVec.pop_back();
        OldVec.push_back(negatedSE);
        // auto isvisited = false;
        // auto isSE_in = (visited.find(SE)==visited.end());
        // auto IsNegate_in = (visited.find(negatedSE)==visited.end());
        // visited.insert(SE);
        // if(!isSE_in && !IsNegate_in) {
        //     //pop it out. this branch has been finished
        //     OldVec.pop_back();
        //     continue;
        // }
        // else{
        //     OldVec.pop_back();
        //     OldVec.push_back(negatedSE);
        //     return;
        // }
    // }
    

    
}
