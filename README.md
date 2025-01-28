DL-Final Project -636

Team Details:
* Ishaan Singh Rawal
* Praroop Chanda
For any assistance in running the code, please contact: -
praroop27@tamu.edu
ishaanrawal@tamu.edu
README:
* To perform hyperparameter tuning using Ray Tune, execute the job files located in the Ray_Tune_Hyperparameter folder. The files are named in the following format:

MyJobRaytune_{Model_Name}_{Optimizer}.sh

* To Train and validate the code on best tuned hyperparameters, execute job files located in best_job_runs folder. The files are named in the following format:
	
MyJob{Model_Name}_bestlr_{Optimizer}.sh

* To evaluate/Test the code, execute job files located in Eval_Job_Runs folder. The files are named in the following format:

EvalJob_{Model_Name}_{Optimizer}.sh

HereÕs how to use them:
1. Replace {Model_Name} with the desired model name.
2. Replace {Optimizer} with the optimizer of your choice.

*** The Training code is available in the Clip1.py file present inside in the iSogCLR>bimodal_exps folder.
*** The code used for hyper-parameter tuning is raytune_eval_search.py present inside iSogCLR>bimodal_exps folder.
*** The clip_train folder contains the json files for training and validation sets.

Link to Pickle file - https://drive.google.com/file/d/1PRy0jNMSTYXJRBwl47RXU-5ijjZoRV1L/view?usp=sharing







