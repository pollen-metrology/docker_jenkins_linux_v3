#!/bin/bash

echo "Usage:"
echo "$0 [aggregated coverage file] a b c d e f"
echo "Where a, b, c, d, e and f are minimal percentage for respectively:"
echo "globalLines globalFunctions pluginsLines pluginsFunctions modulesLines modulesFunctions"

counter=0
isPassing=0
globalLines=$2
globalFunctions=$3
pluginsLines=$4
pluginsFunctions=$5
modulesLines=$6
modulesFunctions=$7

while read value
do
   if [ "$counter" -eq 0  ];then
      if [ $(echo "$value >= $globalLines"|bc) -eq 1 ];then
         printf -- "Global coverage for lines: $value%% \n"
         let "counter++"
      else
         printf -- "Global coverage for lines: $value%% (under acceptable limit = $globalLines%%) \n"
         isPassing=1;
         let "counter++"
      fi
   elif [ "$counter" -eq 1 ];then
      if [ $(echo "$value >= $globalFunctions"|bc) -eq 1 ];then
         printf -- "Global coverage for functions: $value%% \n"
         let "counter++"
      else
         printf --  "Global coverage for functions: $value%% (under acceptable limit = $globalFunctions%%) \n"
         isPassing=1
         let "counter++"
      fi
   elif [ "$counter" -eq 2 ];then
      if [ $(echo "$value >= $pluginsLines"|bc) -eq 1 ];then
         printf --  "Plugins coverage for lines: $value%% \n"
         let "counter++"
      else
         printf --  "Plugins coverage for lines: $value%% (under acceptable limit = $pluginsLines%%) \n"
         isPassing=1
         let "counter++"
      fi
   elif [ "$counter" -eq 3 ];then
      if [ $(echo "$value >= $pluginsFunctions"|bc) -eq 1 ];then
         printf --  "Plugins coverage for functions: $value%% \n"
         let "counter++"
      else
         printf --  "Plugins coverage for functions: $value%% (under acceptable limit = $pluginsFunctions%%) \n"
         isPassing=1
         let "counter++"
      fi
   elif [ "$counter" -eq 4 ];then
      if [ $(echo "$value >= $modulesLines"|bc) -eq 1 ];then
         printf -- "Modules coverage for lines: $value%% \n"
         let "counter++"
      else
         printf --  "Modules coverage for lines: $value%% (under acceptable limit = $modulesLines%%) \n"
         isPassing=1
         let "counter++"
      fi
   else
      if [ $(echo "$value >= $modulesFunctions"|bc) -eq 1 ];then
         printf --  "Modules coverage for functions: $value%% \n"
         let "counter++"
      else 
         printf --  "Modules coverage for functions: $value%% (under acceptable limit = $modulesFunctions%%) \n"
         isPassing=1
         let "counter++"
      fi
   fi  
done < $1

exit $isPassing
