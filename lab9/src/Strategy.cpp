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
std::set<z3::expr_vector> visited_paths;
void searchStrategy(z3::expr_vector &OldVec) {
    //stack of expressions
    //operator to change it !E
    //two ways simple will work: most of points
    //more safiscately dfs
    //global tracking braches static variable.
    //visited set counting DFS
    //if OldVec is now empty, return
    // while (!OldVec.empty()){
    //     std::cout<<" gogo \n";
    //     z3::expr SE = OldVec.back();
    //     OldVec.pop_back();
    //     z3::expr negatedSE = (!SE);
    //     visited.insert(SE);
    //     if(!OldVec.empty() && negatedSE == OldVec.back()) {
    //     //     std::cout<<SE<<" SE \n";
    //     //     std::cout<<negatedSE<<" negated SE \n";
    //     //     //pop it out. this branch has been finished
    //     //         for (auto const &exp: visited){
    //     //     std::cout<<exp<<","<<std::endl;
    //     // }
    //     std::cout<<SE<<" lolo \n";
    //         OldVec.pop_back();
    //         continue;
    //     }
    //     else{
    //         std::cout<<SE<<" haha \n";
    //         std::cout<<negatedSE<<" gaga \n";
    //         OldVec.push_back(SE);
    //         OldVec.push_back(negatedSE);
    //         return;
    //     }
        z3::expr negated_SE= OldVec.back();
        bool is_visited = false;
        do{
            if (OldVec.empty()){
                return;
            }


        }while(!OldVec.empty())
        
        
    

}
}