#$ -N GSrmUKBB.assoc
#$ -l h_rt=1:00:00
#$ -l h_vmem=4G
#$ -t 1-22
#$ -cwd
#$ -e logs
#$ -o logs

. /etc/profile.d/modules.sh
module load igmm/apps/plink/1.90b4

CHR=$SGE_TASK_ID

plink \
  --bfile GS20K_HRC_0.8_GCTA_${CHR} \
  --pheno QCdGS20K_Pheno_dep_status_Unaff_b_only0_Aff_b_only1.txt \
  --covar GenScot_AgeSexPCs.cov \
  --keep QCdGS20K_unrelated_t0.025.fam \
  --remove GSindividualsOverlappingWithUKB500K.txt \
  --logistic \
  --ci 0.95 \
  --maf 0.01 \
  --out GenScot_MDD_rmUKBB.HRC.${CHR} \
  --memory 3000
