#! /usr/bin/env python3

from collections import defaultdict
import itertools
from pathlib import Path
from typing import Dict, Iterable, List, Set
from cbi.data_format import (
    CBILog,
    ObservationStatus,
    Predicate,
    PredicateInfo,
    PredicateType,
    Report,
)
from cbi.utils import get_logs


def collect_observations(log: CBILog) -> Dict[Predicate, ObservationStatus]:
    """
    Traverse the CBILog and collect observation status for each predicate.

    NOTE: If you find a `Predicate(line=3, column=5, pred_type="BranchTrue")`
    in the log, then you have observed it as True,
    further it also means you've observed is complement:
    `Predicate(line=3, column=5, pred_type="BranchFalse")` as False.

    :param log: the log
    :return: a dictionary of predicates and their observation status.
    """
    #if something is not in the dictionary consider status as NEVER
    observations: Dict[Predicate, ObservationStatus] = defaultdict(
        lambda: ObservationStatus.NEVER
    )

    """
    TODO: Add your code here

    Hint: The PredicateType.alternatives will come in handy.
    """
    #iterate each CBILOGENTRY and get relative info to create Predicate/ObservatioNStatus
    for entry in log:
        #How the Predicate key works? if I create a new key with the same col/line how would I check if this key is in observations?
        #Why ObservationStatus does not have a constructor?
        #merge function merge the current value
        line = entry.line #get the line from the CBIEntry
        col = entry.column #get the column from the CBIEntry
        #Predicate.alternative() will return all possible Predicate states. For exmaple [(BranchTrue, True),(BranchFalse, False)]
        #So, we want to add both such Predicate states into the dictionary.
        #Loop the results 
        for predicate in PredicateType.alternatives(entry.value):
            # [(BranchTrue, True),(BranchFalse, False)]
            predicateType = predicate[0] #pred_type
            newObservationStatus = predicate[1] #ObservationStatus
            key = Predicate(line,col,predicateType)
            observations[key]=ObservationStatus.merge(observations[key],newObservationStatus)
            
       
        #each log will have multiple predicates, alternatives from cbi log, returned value,{state,}
        #each entry represents multiple predicates
        
            
    return observations

#Iterable list of CBILOG, you can call certain functions on it, higher class
#netsted lists. logs presents a list of json files. CBILOG includes a list of entries for each json file.
def collect_all_predicates(logs: Iterable[CBILog]) -> Set[Predicate]:
    """
    Collect all predicates from the logs.

    :param logs: Collection of CBILogs
    :return: Set of all predicates found across all logs.
    """
    predicates = set()

    # TODO: Add your code here
    
    for pred in logs:
        for entry in pred:
            #Why does predicate has the same information as cbilogentry and we don't use Cbilogentry directly?
            #Why doesnt CBILogEntry class has a constructor?
            #Do we want to setup predtype here?
            #When do we setup predtype?
            line=entry.line
            col=entry.column
            for predicate in PredicateType.alternatives(entry.value):
            # [(BranchTrue, True),(BranchFalse, False)]
                predicateType = predicate[0]
                newObservationStatus = predicate[1]
                key = Predicate(line,col,predicateType)
                predicates.add(key)
            
                            
    return predicates


def cbi(success_logs: List[CBILog], failure_logs: List[CBILog]) -> Report:
    """
    Compute the CBI report.

    :param success_logs: logs of successful runs
    :param failure_logs: logs of failing runs
    :return: the report
    """
    all_predicates = collect_all_predicates(itertools.chain(success_logs, failure_logs))
    # preparing a dict intialized an empty object of predictateInfo
    predicate_infos: Dict[Predicate, PredicateInfo] = {
        pred: PredicateInfo(pred) for pred in all_predicates
    }

    # TODO: Add your code here to compute the information for each predicate.   
    #iterate through the sucessful runs
    for sucess_log in success_logs:
        #call the collect_observations() method to get all predicates occured in this single run and their status:
        predicatesInASingleFile = collect_observations(sucess_log)
        for predicate, status in predicatesInASingleFile.items():
            # update the corresponding PredicateInfo
            # Example: Predicate = (0,1,BrachTrue), ObservationStatus for this Predicate = (ONLY_TRUE)
            # We will have predicatesInASingleFile[precicate].num_true_in_success+1
            if((status==ObservationStatus.ONLY_TRUE) | (status==ObservationStatus.BOTH)):
                
                predicate_infos[predicate].s+=1
            predicate_infos[predicate].s_obs+=1
    
    for failure_log in failure_logs:
        #call the collect_observations() method to get all predicates occured in this single run and their status:
        predicatesInASingleFile = collect_observations(failure_log)
        for predicate,status in predicatesInASingleFile.items():
            # update the corresponding PredicateInfo
            # Example: Predicate = (0,1,BrachTrue), ObservationStatus for this Predicate = (ONLY_TRUE)
            # We will have predicatesInASingleFile[precicate].num_true_in_success+1
            if((status==ObservationStatus.ONLY_TRUE) | (status==ObservationStatus.BOTH)):
                predicate_infos[predicate].f+=1
            predicate_infos[predicate].f_obs+=1
                
        


    # Finally, create a report and return it.
    report = Report(predicate_info_list=list(predicate_infos.values()))
    return report
