nextflow.enable.dsl=2

include { abacas123_1 } from './modules/abacas123_1/module.nf'
include { abacas456666666_1 } from './modules/abacas456666666_1/module.nf'

workflow {
input1 = Channel.fromPath(params.abacas123_1.meta_scaffold).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1]) }
input2 = Channel.fromPath(params.abacas123_1.fasta)
input3 = Channel.fromPath(params.abacas456666666_1.meta_scaffold).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1]) }
input4 = Channel.fromPath(params.abacas456666666_1.fasta)
abacas123_1(input1, input2)
abacas456666666_1(input3, input4)
}
