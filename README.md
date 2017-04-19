# UPP-n-PASTA-runner


Quick start 
-----------

Install Nextflow runtime with this command: 

    curl -fsSL get.nextflow.io | bash


Run UPP aligner 
---------------

use the following command:

    nextflow run upp_runner.nf --base_dir data/ --name seatoxin
    
Command line options:
---------------------

	--base_dir	Directory containing the protein sequence dataset in fasta format and without containing any 'U'

	--name    	The name of the protein sequence dataset   
    
Prerequisites 
-------------

* Java 7 or later 
* Docker engine 1.0 or later (in alternative you can install the required dependecies as shown in the included [Dockerfile](Dockerfile))
   

