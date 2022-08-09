fMRI Notes
==============

# Lecture

HI everyone, and welcome to the Precision Health Bootcamp for functional mangetic resonance imaging. 

My name is Dr. Alexander Weber. I have been an Assistant Professor in the Department of Pediatrics and a Staff Scientist at BCCHR since the summer of 2019... So three years now.

My research focus is on applying state-of-the-art MRI methods and analyses to investigate neonatal brain health and development.

I am taking over for Lynne Williams, who is a  Computational Neuroscientist at BCCH MRI Research Facility. Lynne experienced a bad bike accident and sustained a concussion. I was asked to sub in for her at the last minute. I have some experience in fMRI data analysis, but am in no way an expert in the field. For expertise at BCCHR, I would look to people like Todd Woodward or Tamara Vanderwal.

## {next slide}

Now that we have that preamble and some of my bone fides out of the way, this is the overview of what I will be covering today

First we will deal with some housekeeping, and then we will discuss MRI Physics, the BOLD effect that fMRI uses to measure brain activity, fMRI pulse sequences, and finally ****

## {next slide}

I would like to acknowledge that we are gathered today on the traditional, ancestral, and unceded territory of the Musqueam people.

## {next slide}

These lectures and tutorials are being shared under the creative commons ShareAlike 4.0 International

You are free to: share: copy and redistribute the material in any medium or format; and adapt: remix, transform, and build upon the material for any purpose

For more information, you can visit this link

## {next slide}

Let's start with some MRI basics

In the bottom left here we have a picture of an MRI scanner. I couldn't get a good picture of our scanner here, but they all look pretty much the same.

In the top left we have a schematic of its components. There is a giant magnet, large gradient coils that are used to get 3D spatial information among other things; a radio frequency coil, and of course a participant

So let's begin by breaking down what MRI stands for

M is for magnetic. We have a large magnet, that can typically range anywhere from 1.5 to 10 Tesla in field strength

For reference, earth's magnetic field is 0.000005 Tesla

Our BC Children's Research MRI is 3 tesla; so 60,000 times earth's magnetic field

R is for resonance, which I will cover more in a minute. MRIs use radiowaves with frequencies that resonante with atomic nuclei (hydrogen usually) in order to manipulate and detect our signal

Imaging: well, when we receive a radiofrequency back, we obtain it in terms of spatial and phase information, that we then convert to an image

## {next slide}

these lectures and tutorials will focus on fMRI, or functional MRI

I will explain in a bit the physics and physiology that allow for fMRI, but for now let's give an overview of what's involved in fMRI experiments

In order to perform the most appropriate fMRI study (either task-based or resting state), researchers/clinicians need to understand its main application fields, intrinsic hemodynamic characteristics (A) and how to best design the experiment [Resting State (B), Block (C), Event related (D), or Mixed (E) designs].

Identification of the most appropriate acquisition techniques (F) and the recognition of the primary artifacts involved (G) are essential.

The acquired data then undergoes several quality control and preprocessing steps [acquisition quality control (H), format conversion (I), slice timing (J), motion correction (K), spatial transformations (L), spatial smoothing (M), and temporal filtering (N)]. 

The intended analysis methods should be implemented for task-based (O) or resting-state fMRI (P) and statistical inferences performed (Q). 

Analysis can be complemented with a variety of different methods for multimodal studies (R). 

Finally, results interpretation should be made with extreme caution.

## {next slide}

For now, let's focus on this concept of resonance. 

A lot of what I will be saying isn’t exactly true; not in our true understanding of the world in terms of quantum mechanics and superpositions

Instead, for the purposes of this lecture, I will be giving an intuitive interpretation, that should still allow for deep understanding of the subject

Let’s begin with the basic physics of the MRI resonance concept

Just like the earth rotates once a day around its rotational axis, this axis itself rotates around another axis (about once every 26,000 years). This change in the orientation of a rotational axis of a rotating body is known as precession.

A gyroscope is another good visual example of this.

In MRI, we use a big and powerful magnet to manipulate the precession of hydrogen atoms (mostly from water). Where does a hydrogen atom’s precession come from?

For a hydrogen atom, which in a water molecule is a proton and a shared electron, the proton has a property known as ‘intrinsic angular momentum’, or spin. For our purposes, we can imagine that the proton spins around an axis, although this isn’t technically the case (quantum mechanics). 

## {next slide}

Because the proton has a charge (positive) and a spin, it is therefore a moving charge. If you remember your highschool physics, electromagnetism states that any moving charge creates a magnetic field. When hydrogen atoms are placed in a big magnet like an MRI, they will line up with the main magnetic field. Some will face up and some will face down.

But back to precession: once placed in the big MRI magnetic field, our hydrogen atoms will rotate around the applied magnetic field. 

## {next slide}

Let’s use the red arrow to represent a hydrogen’s axis. As I said before, some protons are facing up and others facing down. These protons facing up will effectively cancel out the magnetic field of the protons facing down. But there will be a small number that face in one direction giving a net difference that we will ultimately give us a net magnetization. This magnetic field is known as the longitudinal magnetization, which is parallel with the main magnetic field.

## {next slide}

Next, if we give a radiofrequency pulse at the same precessional frequency of these hydrogen atoms (which is around 128MHz or 128 million rotations per second) we can target them and put them in line, or phase. This will also reduce our net longitudinal magnetic field to zero, but now we have a transverse magnetization, which is something we can measure.

## {next slide}

Here is an overview again of what happens when we hit our protons with a radiofrequency pulse of the same frequency that they are precessing at.

##{next slide}

these in phase precessing protons ultimately create a current that we can measure as signal thanks to Faraday’s Law of Induction

## {next slide}

I’m going to simplify things again, and we are just going to focus on this transverse magnetization.

Over time, after we have applied our radiofrequency pulse, the precessing hydrogen atoms will naturally start to get out of step, or out of phase. This dephasing in fMRI scans is due to two factor:

## {next slide}

one is termed T2 relaxation

Also known as spin-spin decay: it is a time measure of the rate of decay caused by spin-spin interactions (essentially spinning protons interacting and making each other move faster or slower with respect to each other.. which results in dephasing)

In pure water, protons move too fast for spin-spin interactions to dephase each other at a fast rate

but in fatty tissues like white matter, protons around the macromolecules will spin slower and will have a large effect on free floating hydrogen atoms around them, resulting in more intense spin-spin interactions and faster dephasing effects

Ultimately, if we have a T2 weighted brain image, water will appear brighter because those transverse magnetic fields are still relatively in phase and provide strong signals. In fatty tissue however, dephasing has been faster, so we will see less signal and will appear darker

## {next slide}

But as I said, in our fMRI scans, we are looking at T2* decay, which is caused by two components. One is the spin-spin interactions. The other is due to static-field inhomogeneities. These are further dephasing caused by magnetic field inhomogeneities. For our purposes, I will only discuss one such source of this magnetic field inhomogeneities: magnetic susceptibility effects

Essentially, atoms with many unpaired electrons create create large susceptibility effects that distort magnetic fields. One such example which will tie beautifully into fMRI is oxygenated vs deoxynated blood.

In oxygenated blood, the iron particles have all of their electrons paired up, creating very little magnetic susceptibility.

However, in deoxygenated blood, the iron particles have four un-paired electrons, creating a large paramagnetic susceptibility which acts to increase the T2* decay.

Essentially: highly oxygenated blood will not increase the decay as much as deoxygenated blood, meaning that oxygenated blood will have a higher signal than deoxygenated blood

## {next slide}

Let’s pause there on the MRI physics for a bit to discuss some brain physiology. 

In order to understand fMRI, we are going to have to understand some things about the brain

One concept we are going to need to understand is something called neurovascular coupling.

The basic idea refers to the relationship between local neural activity and subsequent changes in cerebral blood flow (CBF), the significance of which can be visualized with a picture of the cerebral vascular system

## {next slide}

Let’s consider a single neuron firing. What happens after this event? Neurotransmitters will be released, ATP will be consumed, along with oxygen and glucose.

Since the neuron has used up some oxygen and glucose, this supply of oxygen and glucose needs to be replaced. The supply of these molecules is maintained by cerebral blood flow.

However, there is a weird quirk. The relative increase of CBF is about equal to the magnitude of glucose consumption (a one to one replacement). However, oxygen consumption increases much less than CBF, leading to a net increase in the amount of oxygen present in the blood and tissue. To put this another way, the brain responds to a loss of oxygen by OVER delivering oxygen afterwards. 

This oversupply of oxygen due to the mismatch between CBF and oxygen consumption is the basis of blood-oxygenation level dependent (BOLD) fMRI signal, which detects alterations in levels of deoxygenated hemoglobin and cerebral blood volume.

## {next slide}

I won’t go over the exact mechanisms that result in neurovascular coupling, as I’m not sure anyone is exactly sure. But essentially through astrocytes and secondary signalling pathways, neuronal activation eventually results in vessel dilation and an overabundance of oxygen

## {next slide}

here again is this basic idea of neurovascular coupling
This over oxygenated blood will result in a brighter signal then before the neural activation

Thus, if we can compare activated vs non-activated brain, we will end up with a fMRI image 

## {next slide}

Unlike a photograph, in which the entire picture is taken in a single moment, an fMRI volume is acquired in slices. Each of these slices takes time to acquire - from tens to hundreds of milliseconds.

One entire image of the whole brain in fMRI typically takes around 2 seconds

In that case, our sampling rate would be one volume every two seconds

Typical fMRI scans will take around 5 to 10 minutes.

For 5 minutes and 2 second sampling rate, that results in 150 volumes

The spatial resolution is usually in the range of 2mmx2mm 

## {next slide}

## {next slide}

Block design fMRI experiment. A neural response to the state change from A to B in the stimulus is accompanied by a hemodynamic response that is detected by the rapid and continuous acquisition of MR images sensitized to BOLD signal changes. Using single- or multi-variate time series analysis methods, the average signal difference between the two states is computed for the scan and a contrast map generated. A statistical activation map is finally obtained using a suitable threshold for the difference; the map depicts the probability that a voxel is activated given the uncertainty due to noise and the small BOLD signal differences.

## {next slide}

Correlations between a seed region in the posterior cingulate/precuneus (PCC) and all other voxels in the brain for a single subject during resting fixation. Both correlations (positive
values) and anticorrelations (negative values) are shown, thresholded at R = 0.3. The time course for a single run is shown for the seed region (PCC, yellow), a region positively correlated with this seed region in the medial
prefrontal cortex (MPF, orange), and a region negatively correlated with the
seed region in the intraparietal sulcus (IPS, blue).

# Tutorial

## Commonly Used Modules:

### FSL

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load cuda/11.0
module load fsl
```

### ANTs

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load ants
```

### AFNI

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load afni
```

## Pythong Virtual Environment

```bash
module load Software_Collection/2021
module load gcc/9.4.0 python/3.8.10
module load py-virtualenv/16.7.6
virtualenv fmri_tutorial_env # Create python environment
source fmri_tutorial_env/bin/activate # Activate python environment
```

## Download DICOM from PACS

## Setup your BIDS directory

```bash
module load Software_Collection/2021
module load gcc/9.4.0 python/3.8.10
module load py-virtualenv/16.7.6
virtualenv fmri_tutorial_env # Create python environment
source fmri_tutorial_env/bin/activate # Activate python environment
pip install dcm2bids # Install dcm2bids
cd /scratch/<alloc-code>/
mkdir NewProject && cd NewProject
dcm2bids_scaffold # Create BIDS files and folders
```

## Create your BIDS config file

scp your files over to this space

on your local machine:
```bash
scp PACSfolder/files.zip <cwl>@dtn.sockeye.arc.ubc.ca:/scratch/<alloc-code>/NewProject
```

back to Sockeye:
```bash
mkdir sourcedata/AMWRTD01
unzip files.zip -d sourcedata/AMWRTD01
```

in nano or your favourite text editor, create the following file named `BIDS_config.json`:
```json
{
   "dcm2niixOptions": "-b y -ba y -z y -f '%3s_%f_%d_%r'",
   "descriptions": [
      {
         "dataType": "anat",
         "modalityLabel": "T1w",
         "criteria": {
            "SidecarFilename": "003*"
         }
      },
      {
         "dataType": "anat",
         "modalityLabel": "T2w",
         "criteria": {
            "SidecarFilename": "004*"
         }
      },
      {
         "dataType": "func",
         "modalityLabel": "bold",
         "customLabels": "task-rest_dir-AP",
         "criteria": {
            "SidecarFilename": "009*"
            },
            "sidecarChanges": {
            "TaskName": "rest"
            }
       },
       {
         "dataType": "func",
         "modalityLabel": "bold",
         "customLabels": "task-rest_dir-PA",
         "criteria": {
            "SidecarFilename": "010*"
         },
            "sidecarChanges": {
            "TaskName": "rest"
         }
       }
   ]
}
```

## convert your dicom to nifti in BIDS format (dcm2niix and dcm2bids)

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load cuda/11.0
module load dcm2niix
dcm2bids -d sourcedata/${subid}/ -p ${subid} -c sourcedata/${subid}/BIDS_config.json -o . --forceDcm2niix

```

## check that everything is in order (BIDS Validator)

```bash
mkdir /arc/project/st-weberam2-1/Installations/.npm-global
npm config set prefix '/arc/project/st-weberam2-1/Installations/.npm-global'
NPM_CONFIG_PREFIX=/arc/project/st-weberam2-1/Installations/.npm-global
npm install -g bids-validator
/arc/project/st-weberam2-1/Installations/.npm-global/bin/bids-validator .
echo "work" >> .bidsignore
```
## Get TemplateFlow

```bash
export TEMPLATEFLOW_HOME=/scratch/st-weberam2-1/NewProject/
python -m pip install -U templateflow
python -c "from templateflow.api import get; get(['MNI152NLin2009cAsym', 'MNI152NLin6Asym', 'OASIS30ANTs', 'MNIPediatricAsym', 'MNIInfant'])"
```

## Running fmriprep

```
usage: fmriprep [-h] [--version] [--skip_bids_validation]
                [--participant-label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...]]
                [-t TASK_ID] [--echo-idx ECHO_IDX] [--bids-filter-file FILE]
                [--anat-derivatives PATH] [--bids-database-dir PATH]
                [--nprocs NPROCS] [--omp-nthreads OMP_NTHREADS]
                [--mem MEMORY_MB] [--low-mem] [--use-plugin FILE]
                [--anat-only] [--boilerplate_only] [--md-only-boilerplate]
                [--error-on-aroma-warnings] [-v]
                [--ignore {fieldmaps,slicetiming,sbref,t2w,flair} [{fieldmaps,slicetiming,sbref,t2w,flair} ...]]
                [--longitudinal]
                [--output-spaces [OUTPUT_SPACES [OUTPUT_SPACES ...]]]
                [--me-output-echos] [--bold2t1w-init {register,header}]
                [--bold2t1w-dof {6,9,12}] [--force-bbr] [--force-no-bbr]
                [--medial-surface-nan] [--slice-time-ref SLICE_TIME_REF]
                [--dummy-scans DUMMY_SCANS] [--random-seed _RANDOM_SEED]
                [--use-aroma]
                [--aroma-melodic-dimensionality AROMA_MELODIC_DIM]
                [--return-all-components]
                [--fd-spike-threshold REGRESSORS_FD_TH]
                [--dvars-spike-threshold REGRESSORS_DVARS_TH]
                [--skull-strip-template SKULL_STRIP_TEMPLATE]
                [--skull-strip-fixed-seed]
                [--skull-strip-t1w {auto,skip,force}] [--fmap-bspline]
                [--fmap-no-demean] [--topup-max-vols TOPUP_MAX_VOLS]
                [--use-syn-sdc [{warn,error}]] [--force-syn]
                [--fs-license-file FILE] [--fs-subjects-dir PATH]
                [--no-submm-recon] [--cifti-output [{91k,170k}] |
                --fs-no-reconall] [--output-layout {bids,legacy}]
                [-w WORK_DIR] [--clean-workdir] [--resource-monitor]
                [--reports-only] [--config-file FILE] [--write-graph]
                [--stop-on-first-crash] [--notrack]
                [--debug {compcor,fieldmaps,all} [{compcor,fieldmaps,all} ...]]
                [--sloppy]
                bids_dir output_dir {participant}

```

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_fmriprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o output.txt
#PBS -e error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR
export SINGULARITYENV_TEMPLATEFLOW_HOME=/scratch/st-weberam2-1/NewProject/templateflow
 
singularity run --cleanenv --home $PWD \
--bind /scratch/st-weberam2-1/NewProject:/data \
--bind /scratch/st-weberam2-1/NewProject/derivatives:/out \
/arc/project/st-weberam2-1/Installations/fmriprep/fmriprep-21.0.1.simg \
--participant_label AMWRTD01 \
--fs-license-file /arc/project/st-weberam2-1/license.txt \
/data /out participant
```

```bash
qsub code/fmriprep.pbs
```

Check your status:

```
qstat | grep weberam2
```

## Check Your Output

```bash
scp -r <cwl>@dtn.sockeye.arc.ubc.ca:/scratch/<alloc-code>/NewProject/derivatives your/local/folder/

Firefox sub-AMWRTD01.html
```

## Remove noise identified

if you passed the `--use-aroma` flag

### AROMA:

```bash
fsl_regfilt -i sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz -d sub-AMWRTD01_task-restAP_run-1_desc-MELODIC_mixing.tsv -o sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold_AROMA.nii.gz -f $(cat sub-AMWRTD01_task-restAP_run-1_AROMAnoiseICs.csv)
```

if you don't want to use AROMA:

### fmriprep components:

install `denoiser`

```bash
module load gcc/9.4.0
module load git
git -C /arc/project/st-weberam2-1/Installations clone git@github.com:arielletambini/denoiser.git
export PATH=$PATH:/arc/project/st-weberam2-1/Installations/denoiser
```

```bash
mkdir denoise
run_denoise.py --col_names 'a_comp_cor_00' 'a_comp_cor_01' 'a_comp_cor_02' 'a_comp_cor_03' 'a_comp_cor_04' 'a_comp_cor_05' 'framewise_displacement' 'trans_x' 'trans_y' 'trans_z' 'rot_x' 'rot_y' 'rot_z' --hp_filter .009 --lp_filter .83 sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz sub-AMWRTD01_task-restAP_run-1_desc-confounds_timeseries.tsv denoise
```


## Remove first 10 timepoints

```bash
fslroi sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold_AROMA.nii.gz sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold_AROMA_nodummy.nii.gz 9 -1
```

## Smooth
```bash
module load CVMFS_CC
module load gcc/9.3.0
module load afni
3dmerge -1blur_fwhm 5.0 -doall -prefix sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold_AROMA_5blur.nii.gz sub-AMWRTD01_task-restAP_run-1_space-MNI152NLin2009cAsym_desc-preproc_bold_AROMA_nodummy.nii.gz
```

## Andy's Brainbook

https://andysbrainbook.readthedocs.io/en/latest/fMRI_Short_Course/fMRI_Intro.html

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p </some/path/on/system/>
source </your/path/to/miniconda3/>etc/profile.d/conda.sh
conda create -n AWS -c conda-forge awscli=1.22.63
source </your/path/to/miniconda3/>etc/profile.d/conda.sh
conda activate AWS

```