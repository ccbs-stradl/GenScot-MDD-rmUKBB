# Generation Scotland MDD GWAS removing overlap with UK Biobank

Overlap between Generation Scotland and  UK Biobank was assessed in [Howard et al 2018](https://doi.org/10.1038/s41467-018-03819-3) and [Howard et al 2019]( https://doi.org/10.1038/s41593-018-0326-7). In those analyses, overlap was handled by removing participants from the UKB data sets. Here, we remove them from the GenScot datasets.

Centralized data files were symlinked into this directory before being run. GWAS commands are set up for an SGE cluster.

Build notebooks

On Edinburgh cluster:

```

Rscript "rmarkdown::render('GenScot-MDD-rmUKBB.Rmd')"

```

On [LISA](https://geneticcluster.org/)

```

#Go into interactive mode
srun -n 16 -t 1:00:00 --pty bash -il

#Load R
module load 2019
module load R

# download pandoc
curl -L -O https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-linux-amd64.tar.gz
tar xzf pandoc-2.9.1.1-linux-amd64.tar.gz

export PATH=$PATH:pandoc-2.9.1.1/bin
Rscript -e "rmarkdown::render('GenScot-MDD-rmUKBB-align.Rmd')"

```
