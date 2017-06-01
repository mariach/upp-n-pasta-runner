#!/usr/bin/env nextflow

params.in_dir="/users/cn/mhatzou/Datasets/HomFam/seqs_noBZXU_noDuplicates/"
params.out_dir="UPP_MSAs_NF"
params.name="seatoxin hip scorptoxin cyt3 rnasemam bowman toxin ghf11 TNF sti Stap_Strp_toxin profilin ricin ghf22 ChtBD ins trfl slectin phoslip ltn il8 az kringle cryst DEATH cah mmp rub ghf10 tgfb sodcu KAS DMRL_synthase tms GEL kunitz Sulfotransfer mofe Ald_Xan_dh_2 ghf5 phc aadh annexin serpin cytb asp oxidored_q6 hpr hormone_rec hr tim glob ace cys ghf1 sodfe peroxidase uce flav HMG_box OTCace msb icd proteasome cyclo LIM HLH ldh subt int lyase_1 gpdh egf blm gluts myb_DNA-binding tRNA-synt_2b biotin_lipoyl hom ghf13 aldosered hla Rhodanese PDZ blmb rhv p450 adh aat rrm Acetyltransf sdr zf-CCHH rvp".tokenize()

//params.name="blmb p450 adh aat Acetyltransf sdr zf-CCHH".tokenize()


Channel
  .fromPath("${params.in_dir}/*.fa")
  .map { tuple(it.baseName, it ) }
  .into{ file_names_1; file_names_2 }

//return


/*
process pasta_align{
  publishDir params.out_dir, mode: "copy"
  tag "${name}"
  errorStrategy "ignore"

  input:
      set val(name), file(seq_file) from file_names_1
  output:
      file "${name}_PA.fa" into foo2
  
  """
      python2.7 run_pasta.py --num-cpus ${task.cpus} -i $seq_file -d Protein -j $seq_file -o ${name}_PA.fa
  """
}

*/

process upp_align{
  publishDir params.out_dir, mode: "copy"
  tag "${name}"
  //errorStrategy "ignore"

  input:
      set val(name), file(seq_file) from file_names_2
  output:
      file "${name}.aln" into foo3
  
  """
      perl ${baseDir}/bin/replace_U.pl ${seq_file}
      run_upp.py -s ${seq_file} -m amino --cpu ${task.cpus} -d outdir -o ${name}.aln
      mv outdir/${name}.aln_alignment.fasta ${name}.aln
  """
}
