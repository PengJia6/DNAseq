# ==============================================================================
# Project: DNAseq
# Script : test3.smk TODO check 
# Author : Peng Jia
# Date   : 2020.07.14
# Email  : pengjia@stu.xjtu.edu.cn
# Description: TODO
# ==============================================================================

# localrules: a
# ruleorder: a > b


# rules: TODO
# description: TODO
# input: TODO
# output: TODO
rule TODO:
    input:
         "",
    output:
          "",
    log:
       ""
    benchmark:
             ""
    threads: 8
    run:
        shell("command 1")
        shell("command 2")

# rules: TODO
# description: TODO
# input: TODO
# output: TODO
rule TODO2:
    input:
         "",
    output:
          "",
    log:
       ""
    benchmark:
             ""
    threads: 8
    shell:
         """
         command 1 
         command 2
         """