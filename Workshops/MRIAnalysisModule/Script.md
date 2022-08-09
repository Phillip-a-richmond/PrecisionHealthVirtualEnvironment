fMRI Notes
==============

# Lecture 1

HI everyone, and welcome to the Precision Health Bootcamp for functional mangetic resonance imaging. 

My name is Dr. Alexander Weber. I have been an Assistant Professor in the Department of Pediatrics and a Staff Scientist at BCCHR since the summer of 2019... So three years now.

My research focus is on applying state-of-the-art MRI methods and analyses to investigate neonatal brain health and development.

## {next slide}

I am taking over for Lynne Williams, who is a  Computational Neuroscientist at BCCH MRI Research Facility. Lynne experienced a bad bike accident and sustained a concussion. I was asked to sub in for her at the last minute. I have some experience in fMRI data analysis, but am in no way an expert in the field. For expertise at BCCHR, I would look to people like Todd Woodward or Tamara Vanderwal.

## {next slide}

Now that we have that preamble and some of my bone fides out of the way, this is the overview of what I will be covering today

First we will deal with some housekeeping, and then we will give and fMRI overview, learning objectives, go over an intuitive understanding of MRI Physics, the BOLD effect that fMRI uses to measure brain activity, fMRI acquisition in order to understand what happens during preprocessing, and finally we will get onto Sockeye and play around with it and show you how to load modules you will likely be interested in and run fmriprep

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

**{click}**

Right, so I will briefly speak about MRI Physics to give an intutitive understanding of what's going on and how we can use magnets to non-invasively look inside someone's brain and measure activity
Which will require me to talk briefly about brain physiology as well
We'll talk about some of the finer points about fMRI acquisition
and I'll finish by just briefly talking about task vs resting state fMRI

Then I will move onto the Tutorial part of this session.
I will show how to acquire data from the PACS/XNAT system, which is what we use at BC Children's Research Insitute. I will copy that data over to Sockeye, and convert the dicom files to nifti
I will discuss BIDS, which is a brain imaging data structure standardization 
how to preprocess our data using singularity and fmriprep
and maybe I'll get into some nuissance regression in two different ways

## {next slide}

The learning objectives for this session are as follows.
At the end of this session, students will be able to:
describe how MRIS produce and detect signal from the body
describe how brain activity can alter MRI signals
describe the difference between task and resting state fmri
how to download data from open resources online to sockeye
how to run fmriprep on sockeye to preprocess your fmri data

## {next slide}

For now, let's focus on this concept of resonance. 

A lot of what I will be saying isn’t exactly true; not in our true understanding of the world in terms of quantum mechanics and superpositions

Instead, for the purposes of this lecture, I will be giving an intuitive interpretation, that should still allow for deep understanding of the subject

Let’s begin with the basic physics of the MRI resonance concept

Just like the earth rotates once a day around its rotational axis, this axis itself rotates around another axis (about once every 26,000 years). This change in the orientation of a rotational axis of a rotating body is known as precession.

**{click}**

A gyroscope is another good visual example of this.

I don't have one here with me, but you can get a gyroscope to spin, but also precess around a vertical axis

**{click}**

In MRI, we use a big and powerful magnet to manipulate the precession of hydrogen atoms (mostly from water). Where does a hydrogen atom’s precession come from?

For a hydrogen atom, which in a water molecule is a proton and a shared electron, the proton has a property known as ‘intrinsic angular momentum’, or spin. For our purposes, we can imagine that the proton spins around an axis, although this isn’t technically the case (quantum mechanics). 

## {next slide}

Because the proton has a charge (positive) and a spin, it is therefore a moving charge. If you remember your highschool physics, electromagnetism states that any moving charge creates a magnetic field. 

**{click}**

When hydrogen atoms are placed in a big magnet like an MRI, they will line up with the main magnetic field. Some will face up and some will face down.

**{click}**

At the same time, each hydrogen atom will rotate around the applied magnetic field. 

**{click}**

## {next slide}

Let’s use the red arrow to represent a hydrogen’s axis. As I said before, some protons are facing up and others facing down. These protons facing up will effectively cancel out the magnetic field of the protons facing down. But there will be a small number that face in one direction giving a net difference that we will ultimately give us a net magnetization. 

**{click}**

This magnetic field is known as the longitudinal magnetization, which is parallel with the main magnetic field.

## {next slide}

Next, if we give a radiofrequency pulse at the same precessional frequency of these hydrogen atoms (which is around 128MHz or 128 million rotations per second at 3 Tesla) we can target them and put them in line, or phase. This will also reduce our net longitudinal magnetic field to zero, but now we have a transverse magnetization, which is something we can measure.

## {next slide}

Here is an overview again of what happens when we hit our protons with a radiofrequency pulse of the same frequency that they are precessing at.

## {next slide}

these in phase precessing protons ultimately create a current that we can measure as signal thanks to Faraday’s Law of Induction

## {next slide}

let's pause here for a quick recap

Proton's have quantum mechanical spin

when placed in a large magnet (MRI), these protons precess around the main magnetic field

some face up, and others face down, many cancelling each other out

if we send an RF pulse at the same precession frequency, we can put these protons in phase and equal out the up and down spins, we create a transverse magnetic field and destroy the longitudinal one

this transverse magnetic field can be measured thanks to Faraday's Law of Induction

## {next slide}

I’m going to simplify things again, and we are just going to focus on this transverse magnetization.

Over time, after we have applied our radiofrequency pulse, the precessing hydrogen atoms will naturally start to get out of step, or out of phase. This dephasing in fMRI scans is due to two factor:

## {next slide}

one is termed T2 relaxation

Also known as spin-spin decay: it is a time measure of the rate of decay caused by spin-spin interactions (essentially spinning protons interacting and making each other move faster or slower with respect to each other.. which results in dephasing)

## {next slide}

In pure water, protons move too fast for spin-spin interactions to dephase each other at a fast rate

but in fatty tissues like white matter, protons around the macromolecules will spin slower and will have a large effect on free floating hydrogen atoms around them, resulting in more intense spin-spin interactions and faster dephasing effects

**{click}**

Ultimately, if we have a T2 weighted brain image, water will appear brighter because those transverse magnetic fields are still relatively in phase and provide strong signals. In fatty tissue however, dephasing has been faster, so we will see less signal and will appear darker

## {next slide}

But, in our fMRI scans, we will be looking at T2* decay, which is caused by two components. One is the spin-spin interactions. The other is due to static-field inhomogeneities. These are further dephasing caused by magnetic field inhomogeneities. For our purposes, I will only discuss one such source of this magnetic field inhomogeneities: magnetic susceptibility effects

## {next slide}

Essentially, atoms with many unpaired electrons create large susceptibility effects that distort magnetic fields. One such example which will tie beautifully into fMRI is oxygenated vs deoxynated blood.

In oxygenated blood, the iron particles have all of their electrons paired up, creating very little magnetic susceptibility.

**{click}**

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

Thus, if we can compare activated vs non-activated brain, we will end up with a fMRI image (at least for task analysis)

## {next slide}

I know that was a lot, so let's just summarize what we learned

under normal conditions, oxygenated hemoglobin is converted to deoxyhemoglobin within the capillary bed at a constant rate

when neurons become active, the vascular system supplies more oxygenated hemoglobin than is needed via an overcompensatory increase in blood flow

the result is a net decrease in deoxygenated hemoglobin and a corresponding decrease in signal loss due to T2* effects

## {next slide}

Here is a chart showing the relative levels of both oxygenated and deoxygenated hemoglobin on the left

and on the right is the change in signal that we detect

This is also what is called the hemodyanmic response function

as you can see, after time 0 which is we have neuronal activation, it isn't until seconds later that we actually can detect a siganl

I just want to also note here, historically this shape has often times been assumed when it comes to fmri task-based processing, but that in reality every person's brain, brain regions, and different tasks will result in very different shapes. So this should not be assumed

## {next slide}

Now that we understand a little more about how MRIs work, and how brain activity can result in a MRI signal that we can detect (what is called the BOLD effect), I want to talk a little bit about how we acquire fMRI images

On the top here I have a simplified pulse sequence. Because we want to have a high temporal resolution, we need fast ways of acquiring our data

One such technique is called echo planar imaging

Essentially, it is a method of acquiring one slice of the brain in a very short period using a single RF pulse

On the bottom is a single slice of k-space being acquired with EPI. K space sounds super weird, and it is little hard to understand, but is essentially spatial phase and frequency values that can be converted into an image of signal magnitude and cartesian coordinates using an inverse fourier transform

## {next slide}

Unlike a photograph, in which the entire picture is taken in a single moment, an fMRI volume is acquired in slices. Each of these slices takes time to acquire - from tens to hundreds of milliseconds.

One entire image of the whole brain in fMRI typically takes around 2 seconds

In that case, our sampling rate would be one volume every two seconds

Typical fMRI scans will take around 5 to 10 minutes.

For 5 minutes and 2 second sampling rate, that results in 150 volumes

The spatial resolution is usually in the range of 2mmx2mm 

## {next slide}

On the top here is a full fMRI volume. Left is sagittal, center is coronal, and right is an axial slice.

As you can see, the spatial resolution is such that the brain looks very pixelated. So fMRI is generally low on both temporal resolution at around 2 seconds generally, and spatial resolution, at around 2mm generally. 

On the bottom, I have the time-series for a single point of our fMRI acquisiton. So this point is the voxel in the middle of the green cross hairs

essentially, this is the signal magnitude at this point in the brain over time... or a surrogate for brain activity

## {next slide}

Block design fMRI experiment. A neural response to the state change from A to B in the stimulus is accompanied by a hemodynamic response that is detected by the rapid and continuous acquisition of MR images sensitized to BOLD signal changes. Using single- or multi-variate time series analysis methods, the average signal difference between the two states is computed for the scan and a contrast map generated. A statistical activation map is finally obtained using a suitable threshold for the difference; the map depicts the probability that a voxel is activated given the uncertainty due to noise and the small BOLD signal differences.

## {next slide}

Correlations between a seed region in the posterior cingulate/precuneus (PCC) and all other voxels in the brain for a single subject during resting fixation. Both correlations (positive
values) and anticorrelations (negative values) are shown, thresholded at R = 0.3. The time course for a single run is shown for the seed region (PCC, yellow), a region positively correlated with this seed region in the medial
prefrontal cortex (MPF, orange), and a region negatively correlated with the
seed region in the intraparietal sulcus (IPS, blue).

## {next slide}

Ok, after covering the basics of MRI physics, the hemodynamic response function and BOLD effect, and some fMRI acquisition and analyses, let's move on the the main event: fmri preprocessing

essentially, because fMRI is so noisy, and because motion is such a nuissance, it is very important that we preprocess our data in order to get the best analysis possible.

we can think of preprocessing as cleaning up our image and getting it into the best state possible

preprocessing involves first a lot of anatomical processing using a T1-weighted image, which I didn't have time to go over.
But essentially, because our fMRI image is so low in terms of spatial resolution, we need a nice high resolution T1 weighted image in order for us to do such things as skull-stripping, and spatial normalization, which means moving all of our subjects fMRI images into a shared space
we also use T1 weighted images to segment the brain into different tissue types and for surface reconstruction

**{click}**

next we register each fmri brain scan to each other, which is called motion correction
we correct for slice-timing effects, which come about because we had to acquire each slice separately, so we need to take that timing into acccount
susceptibility distortions can be corrected for... and these are usually cause by magnetic inhomogeneities from regions with air-tissue interfaces, such as near the eyes and sinus cavity.
we can then attempt to remove noise artifacts, such as those caused by breathing, cardiovascular activity, motion, etc.
And finally we would like to be able to look at our data for initial quality control

So as you can see, there is a lot that needs to be done in the preprocessing stages

If everyone were to prerprocess in different ways, it can result in completely different results using the same data

Which is why one solution to this is to suggest a standard technique to preprocesing, which is what I will be covering today with fmriprep

# Tutorial


## Download DICOM from PACS

log into the BCCHR VPN

I use global-protect. Information on how to recmotely connect is available on the BCCHR Support Hub

https://3tfmri-xnat.bcchr.ca/app/template/Login.vm

download as a zip file

secure copy over to UBC

again, if you are remote:

log off the BCCHR VPN

log onto the UBC VPN

## Sockeye

log into sockeye. If you are at home, you will have to be logged onto the UBC VPN

your screen may look a little different from mine, as I have customized my bash with bash-it

## BIDS

https://bids.neuroimaging.io/

https://bids-specification.readthedocs.io/en/stable/

## Python Virtual Environment

```bash
cd /arc/project/st-weberam2-1
mkdir Installations
module load Software_Collection/2021
module load gcc/9.4.0 python/3.8.10
module load py-virtualenv/16.7.6
virtualenv fmri_tutorial_env # Create python environment
source fmri_tutorial_env/bin/activate # Activate python environment
```

## Setup your BIDS directory

```bash
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

more help: https://unfmontreal.github.io/Dcm2Bids/

## check that everything is in order (BIDS Validator)

```bash
mkdir /arc/project/st-weberam2-1/Installations/.npm-global
npm config set prefix '/arc/project/st-weberam2-1/Installations/.npm-global'
NPM_CONFIG_PREFIX=/arc/project/st-weberam2-1/Installations/.npm-global
npm install -g bids-validator
/arc/project/st-weberam2-1/Installations/.npm-global/bin/bids-validator .
echo "work" >> .bidsignore
```

## Commonly Used Modules:

### Freesurfer

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load freesurfer
```

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

## Get TemplateFlow

```bash
export TEMPLATEFLOW_HOME=/scratch/st-weberam2-1/NewProject/
python -m pip install -U templateflow
python -c "from templateflow.api import get; get(['MNI152NLin2009cAsym', 'MNI152NLin6Asym', 'OASIS30ANTs', 'MNIPediatricAsym', 'MNIInfant'])"
```

## Running fmriprep

```bash
module purge
module load singularity
singularity build <yourinstallationfolder>/fmriprep-21.0.1.simg docker://nipreps/fmriprep:21.0.1
```

https://fmriprep.org/en/stable/

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

PBS = Portable Batch System

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_freesurfer
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o freesurfer_output.txt
#PBS -e freesurfer_error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR

SCRATCH_DIR=/scratch/st-weberam2-1/NewProject

export SINGULARITYENV_TEMPLATEFLOW_HOME=${SCRATCH_DIR}/templateflow

export SINGULARITY_CACHEDIR=$SCRATCH_DIR
 
singularity run --cleanenv --home $PWD \
--bind ${SCRATCH_DIR}:/data \
--bind ${SCRATCH_DIR}/derivatives:/out \
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
qstat -u $USER
```

## Check Your Output

on your local machine

```bash
scp -r <cwl>@dtn.sockeye.arc.ubc.ca:/scratch/<alloc-code>/NewProject/derivatives your/local/folder/

Firefox sub-AMWRTD01.html
```

## Remove noise identified

if you passed the `--use-aroma` flag

### AROMA:

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load cuda/11.0
module load fsl
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

## OpenNeuro

https://openneuro.org/

search `reading`

```bash
cd /arc/project/st-weberam2-1
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /arc/project/st-weberam2-1/Installations
source /arc/project/st-weberam2-1/Installations/miniconda3/etc/profile.d/conda.sh
conda create -n AWS -c conda-forge awscli=1.22.63
source /arc/project/st-weberam2-1/Installations/miniconda3/etc/profile.d/conda.sh
conda activate AWS

aws s3 sync --no-sign-request s3://openneuro.org/ds003974 ds003974-download/
```

```bash
#!/bin/bash
 
#PBS -l walltime=96:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_fmriprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o fmriprep_output.txt
#PBS -e fmriprep_error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR
export SINGULARITYENV_TEMPLATEFLOW_HOME=/scratch/st-weberam2-1/NewProject/templateflow

SCRATCH_DIR=/scratch/st-weberam2-1

singularity run --cleanenv --home $PWD \
--bind ${SCRATCH_DIR}/OpenNeuro-ReadingBrainProjectL1:/data \
--bind ${SCRATCH_DIR}/OpenNeuro-ReadingBrainProjectL1/derivatives/fmriprep:/out \
/arc/project/st-weberam2-1/Installations/fmriprep/fmriprep-21.0.1.simg \
-w ${SCRATCH_DIR}/work \
--skip_bids_validation \
--participant_label 47 \
--task-id rest \
--fs-license-file /arc/project/st-weberam2-1/license.txt \
--use-aroma \
--fs-subjects-dir ${SCRATCH_DIR}/derivatives/freesurfer \
/data /out participant
```

# Second Session: Lecture

# Second Session: Lecture 1

HI everyone, and welcome to the Precision Health Bootcamp for functional mangetic resonance imaging. 

My name is Dr. Alexander Weber. I have been an Assistant Professor in the Department of Pediatrics and a Staff Scientist at BCCHR since the summer of 2019... So three years now.

My research focus is on applying state-of-the-art MRI methods and analyses to investigate neonatal brain health and development.

## {next slide}

I am taking over for Lynne Williams, who is a  Computational Neuroscientist at BCCH MRI Research Facility. Lynne experienced a bad bike accident and sustained a concussion. I was asked to sub in for her at the last minute. I have some experience in DTI data analysis, but am in no way an expert in the field. For expertise at BCCHR, I would look to people like Steven Miller, Tim Oberlander, Ruth Grunau and Juill Zwicker who I believe have all published DTI studies.

## {next slide}

Now that we have that preamble and some of my bone fides out of the way, this is the overview of what I will be covering today

First we will deal with some housekeeping, and then we will discuss some more MRI Physics, a quick tutorial on how to run Freesurfer analysis, a lecture on diffusion and diffusion weighted imaging, and finally a tutorail showing one way to preprocess your diffusion weighted images using something called qsiprep

## {next slide}

I would like to acknowledge that we are gathered today on the traditional, ancestral, and unceded territory of the Musqueam people.

## {next slide}

These lectures and tutorials are being shared under the creative commons ShareAlike 4.0 International

You are free to: share: copy and redistribute the material in any medium or format; and adapt: remix, transform, and build upon the material for any purpose

For more information, you can visit this link

## {next slide}

so today I'm going to be talking about freesurfer, which is a program out of harvard that does a lot of good anatomical segmentation and surface based analysis

so at the top here we have an example where we have some basic tissue segmentation on the left, and on the right, we have surface based segmentaion into broadman areas (I think)

**{click}**

and just below this image is the preprocessing and reconstruction steps in diffusion weighted imaging

So for my first lecture I will discuss T1 and T2 weighted imaging, give you a short tutorital on freesufer, go back to talk about DTI physics, and then give a short tutorial on Sockeye for diffusion preprocessing using qsiprep

## {next slide}

for our learning objectives, at the end of the session, students will be able to:
describe the difference between T1 and T2 weighted images
how to run freesurfer on sockeye
describe why water diffusion in the brain can help us understand white matter structure
describe how MRIs detect diffusion in different directions
and how to run qsiprep to preprocess DWI on sockeye

## {next slide}

In our last session, we covered T2 weighted imaging. We discussed spin-spin exponential signal decay, and how water is bright on T2 weighted images as the hydrogren atoms in watery tissue spin too fast to dephase much
Tissue that is more a mix of water and tissue, like grey matter, ends up looking grey as there are more opportunities for dephasing to occur
and finally fatty tissue like white matter or myelin end up very dark, as there is more dephasing

## {next slide}

T1 weighted images are almost the opposite of T2. 

and personally for me, I always remember if an image is T1 because white matter looks white, and grey matter looks grey

Fatty tissue like white matter ends up with a lot of signal, so it looks bright or white
Grey matter ends up looking grey
And water is oftentimes black or no signal

Let's discuss why T1 weighted images look like this

## {next slide}

Let's return to looking at the spins after we have flipped them into the transverse plain

to make things simpler, we will ignore T2 decay, or transverse magnetization

We are only looking at longitudinal magnetization, which is a different and independent component

In the example on the left, after we applied a 90 degree pulse, instead of having a slight difference in protons that spun up or down, there was no difference, cancelling each other out completely leaving no longitudinal magnetization

However, through spin-lattice relaxation, some of the down spins will shift to up spins
As this process occurs, we slowly regain the longitudinal magnetization

## {next slide}

So let's summarize T1 relaxation: it's also known as spin-lattice or longitudinal relaxation. It measures the rate of recovery caused by spin-lattice interactions. 

The relaxation looks like this, which is kind of the opposite of spin-spin relaxation.

## {next slide}

Since we consider the net magnetization being ﬂipped through 90 by the RF pulse, it is tempting to think of the relaxation processes as simply being the reverse, with longitudinal mag slowly turning through –90 back to its equilibrium position. This would explain the gradual loss of transverse magnetization and recovery of the longitudinal magnetization. However, it would also imply that T 1 and T 2 must be equal to each other, and we know that this is not the case in biological tissues.

T 2 dephasing happens very quickly, so the transverse magnetization is zero after only a few hundred milliseconds. T 1 relaxation is much slower and it takes several seconds before longitudinal mag is fully restored along the z axis.

**{click}**

T 1 relaxation is the loss of the extra energy from the spin system to the surrounding environment, or ‘lattice’ (hence ‘spin-lattice’ relaxation time).
This energy loss is unrecoverable and represents the transfer of heat; hence the origin of the T1 synonym "thermal relaxation". This energy must be transferred somewhere, and that "somewhere" is into nearby nuclei, atoms, and molecules through collisions, rotations, or electromagnetic interactions. At the most basic level, therefore, T1-relaxation is simply an energy flow between spins and their external environment.

In order to induce the transitions needed for T 1 relaxation the ﬂuctuations have to be at the Larmor frequency, For example, more protons with intermediate binding tumble at the Larmor frequency than protons in either free ﬂuids or bound in hydration layers. Hence the T 1 s of such protons are short while both bound and free protons have long T1s

Now you might be wondering why I am talking about T1 weighted images for this talk.

## {next slide}

The reason is, we are now going to go over an neuroimaging software package called freesurfer and what it does.

Most people will be familiar with Freesurfer as a program that allows a user to do volume and surface based analyses

The pipeline takes in a T1 weighted input due to the greater white and grey matter contrast T1 provides in adults. It will then skull-strip / create a brain mask. 

Different tissues will be identified and labeled, such as ventricles, thalamus, pallidum, putamen, cortical white matter, amygdala, hippocampus, cortical grey matter, cerebeller grey matter, cerebeller white matter

Next is intensity normalization, white matter segmentation, surface atlas registration which aides in inter-subject comparisons of cortical surfaces, and finally gyral labeling.

## {next slide}

the general workhorse of Freesurfer is `recon-all`

Let's see how I can run that in Sockeye

# Second Session: Tutorial 1

## Freesurfer

https://surfer.nmr.mgh.harvard.edu/fswiki

```bash
module load CVMFS_CC
module load gcc/9.3.0
module load freesurfer
mkdir -p derivatives/freesurfer
recon-all -i sub-47/anat/sub-47_T1w.nii.gz -s sub-47 -sd derivatives/freesurfer -all
```

PBS:

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_freesurfer
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o freesurfer_output.txt
#PBS -e freesurfer_error.txt
 
################################################################################

module load CVMFS_CC
module load gcc/9.3.0
module load freesurfer

cd $PBS_O_WORKDIR

SCRATCH_DIR=/scratch/st-weberam2-1/OpenNeuro-ReadingBrainProjectL1

recon-all -i ${SCRATCH_DIR}/sub-47/anat/sub-47_T1w.nii.gz -s sub-47 -sd ${SCRATCH_DIR}/derivatives/freesurfer -all
```

output files: https://surfer.nmr.mgh.harvard.edu/fswiki/ReconAllOutputFiles

# Second Session: Lecture 2

## {next slide}

Ok now we're going to talk about the last lecture portion, which will be about diffusion weighted imaging

diffusion-weighted imaging is an MRI technique based on the tissue water diffusion rate

It allows for very sensitive probing of water movements within the architecture of the tissues

**{click}**

This water movement is based on something called Brownian Motion, which describes the random motion of particles suspended in a medium

**{click}**

Basically, if water is free to move around, it will do just that. But if it is restricted, it either won't move around much, or will move in a very restricted way (like, say, a specific direction)

## {next slide}

The way in which diffusion information is extracted from the tissue is to first obtain a T2* weighted image with no diffusion attenuation. This is known as the b=0 image.

Next, the ease with which water can diffuse is assessed in various directions; the minimum is 3 orthogonal directions (X, Y and Z) and we will use this for the rest of this explanation.

This is done by applying a strong gradient symmetrically on either side of the 180-degree pulse. The stronger these gradients, the more pronounced the diffusion-related signal attenuation. 

Stationary water molecules acquire phase information by the application of the first gradient. After the 180-degree pulse, however, they are exposed to the exact same gradient (because they have not changed location) which undoes all the effects of the first (since they have flipped 180-degrees). Hence at the time the echo is generated they have retained their signal.

Moving water molecules, on the other hand, acquire phase information by the first gradient but as they are moving when they are exposed to the second gradient they are not in the same location and thus are not exposed to precisely the same gradient after the 180-degree pulse. Hence they are not rephased and they lose some of their signal. The further they are able to move the less successfully they will be rephased and the less signal will remain. 

## {next slide}

I can show you how this looks

So remember, if a diffusion gradient in a specific direction is applied, water that can move in that direction will show little signal, whereas water that is restricted in that direction will be bright

This picture shows diffusion images along three orthogonal directions, Anterior-Posterior, Left-Right, and Superior-Inferior

Ventricles are dark, because water can move freely, whereas tissue that has cell membranes and such are brighter

In the anterior-posterior on the left, these white matter tracts in the frontal lobe are dark, because they run front and back, so signal is lost as the water is diffusing more easily in this direction

## {next slide}

One example of the use of DWI is something called DTI: Diffusion Tensor Imaging, which allows for the indirect measurement of the degree of anisotropy (direction bias) and structural orientation

While DWI refers to the contrast of the acquired images, DTI is a specific type of modeling of the DWI datasets. There are many other models!

Summarily, the basic concept behind DTI is that water molecules diffuse differently along the tissues depending on its type, integrity, architecture, and presence of barriers, giving information about its orientation and quantitative anisotropy

Based on this assumption, one can model the diffusion process by an ellipsoid, which can mathematically be represented by a 3 × 3 symmetric matrix, also known as tensor (hence DTI's name origin).

With DTI analysis it is possible to create a fractional anisotropy map, where Fractional anisotropy is an index for the amount of diffusion asymmetry within a voxel, defined in terms of its eigenvalues

The value of FA varies between 0 and 1. For perfect isotropic diffusion, λ1 = λ2 = λ3, the diffusion ellipsoid is a sphere, and FA = 0. With progressive diffusion anisotropy, the eigenvalues become more unequal, the ellipsoid becomes more elongated, and the FA → 1. The FA map is a gray-scale display of FA values across the image. Brighter areas are more anisotropic than darker areas.

You can also create a Principal Diffusion Direction Map. This is a map that assigns colors to voxels based on a combination of anisotropy and direction. The color assignment is arbitrary, but the typical convention is to have the orientation of the principal eigenvector (ε1) control hue and fractional anisotropy (FA) control brightness. 

## {next slide}

Finally, another example is a fibre tracking map

Axonal tracts are commonly mapped using a deterministic method known as FACT (fiber assignment by continuous tracking).  In this method the user selects "seed voxels" in a certain area of the brain and automated software computes fiber trajectories in and out of that area. This is accomplished by following the primary eigenvector (ε1) in each voxel until it encounters a neighboring voxel, at which time the trajectory is changed to point in the direction of the new eigenvector.

## {next slide}

The artifacts in DWI datasets are mainly related with the gradient system hardware, pulse sequence, acquisition strategy used and motion. DWI data are generally collected to cover the entire brain by repeating the acquisition while varying the orientation or magnitude of the diffusion gradients. 

DWI has low Signal-to-Noise Ratio (SNR) and resolution and is very susceptible to motion. To reduce the influence of motion artifacts, the scan time can be reduced. This makes the use of Single-shot Echo Planar Imaging (EPI) the typical strategy employed to reduce this sensitivity 

Thus, just like in fMRI imaging, we had T2* related distortions, motion correction, and EPI related issues to fix, along with new ones, such as eddy currents.

Again, just like in fMRI, we will use a standardized pipeline to try to preprocess our data. The program I will show is called qsiprep

# Second Session: Tutorial 2

## qsiprep

https://qsiprep.readthedocs.io/en/latest/

```bash
module load singularity
singularity pull <yourinstallationdirectory>/qsiprep-0.15.2.sif docker://pennbbl/qsiprep:0.15.2 #build <yourinstallationdirectory>/qsiprep-0.15.2.sif docker://pennbbl/qsiprep:0.15.2
```

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_qsiprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o qsiprep_output.txt
#PBS -e qsiprep_error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR

SCRATCH_DIR=/scratch/st-weberam2-1/OpenNeuro-ReadingBrainProjectL1

export SINGULARITY_CACHEDIR=$SCRATCH_DIR

singularity run --cleanenv --home $PWD \
--bind ${SCRATCH_DIR}:/data \
--bind ${SCRATCH_DIR}/derivatives:/out \
/arc/project/st-weberam2-1/Installations/qsiprep/qsiprep-0.15.2.sif \
--participant_label 47 \
--fs-license-file /arc/project/st-weberam2-1/license.txt \
--output-resolution 1.8 \
/data /out participant
```

## Boilerplate

## Files (bval, bvec, nii.gz)

## Reconstructions

### Simple DTI

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_qsiprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o qsiprep_output.txt
#PBS -e qsiprep_error.txt
 
################################################################################
 
module load CVMFS_CC
module load gcc/9.3.0
module load cuda/11.0
module load fsl

cd $PBS_O_WORKDIR

dwifol=derivatives/qsiprep/sub-47/dwi

mkdir derivatives/dti

dtifit -k ${dwifol}/sub-47_acq-multiband_space-T1w_desc-preproc_dwi.nii.gz -o derivatives/dti/dtifit -m ${dwifol}/sub-47_acq-multiband_space-T1w_desc-brain_mask.nii.gz -r ${dwifol}/sub-47_acq-multiband_space-T1w_desc-preproc_dwi.bvec -b ${dwifol}/sub-47_acq-multiband_space-T1w_desc-preproc_dwi.bval

```

**Show DTI Files**

FSLEyes, load FA and V1

V1 modulated by FA

### AMICO NODDI:

https://github.com/daducci/AMICO

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_qsiprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o qsiprep_output.txt
#PBS -e qsiprep_error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR

SCRATCH_DIR=/scratch/st-weberam2-1/OpenNeuro-ReadingBrainProjectL1
 
singularity run --cleanenv -e --home $PWD \
--bind ${SCRATCH_DIR}:/data \
--bind ${SCRATCH_DIR}/derivatives:/out \
/arc/project/st-weberam2-1/Installations/qsiprep/qsiprep-0.15.2.sif \
--participant_label 47 \
--skip_bids_validation \
--recon-only --recon_input ${SCRATCH_DIR}/derivatives/qsiprep --recon_spec amico_noddi \
--fs-license-file /arc/project/st-weberam2-1/license.txt \
--output-resolution 1.8 \
/data /out participant
```

**IF THAT DOESN'T WORK:**

```bash
source /arc/project/st-weberam2-1/Installations/fmri_tutorial_env/bin/activate
pip install dmri-amico
```

PYTHON:

```python
import amico
amico.setup()
amico.util.fsl2scheme("derivatives/qsiprep/sub-47/dwi/sub-47_acq-multiband_space-T1w_desc-preproc_dwi.bval", "derivatives/qsiprep/sub-47/dwi/sub-47_acq-multiband_space-T1w_desc-preproc_dwi.bvec")

ae = amico.Evaluation("derivatives/qsiprep", "sub-47/dwi")
ae.load_data( "sub-47_acq-multiband_space-T1w_desc-preproc_dwi.nii.gz", "sub-47_acq-multiband_space-T1w_desc-preproc_dwi.scheme", mask_filename="sub-47_acq-multiband_space-T1w_desc-preproc_dwi_mask.nii.gz", b0_thr=0 )

ae.set_model("NODDI")
ae.generate_kernels()

ae.load_kernels()
ae.fit()
ae.save_results()
```

## Tractography:

https://www.mrtrix.org/

```bash
#!/bin/bash
 
#PBS -l walltime=48:00:00,select=4:ncpus=32:mem=48gb
#PBS -N weber_qsiprep
#PBS -A st-weberam2-1
#PBS -m abe
#PBS -M alex.weber@ubc.ca
#PBS -o qsiprep_output.txt
#PBS -e qsiprep_error.txt
 
################################################################################
 
module load singularity
 
cd $PBS_O_WORKDIR

SCRATCH_DIR=/scratch/st-weberam2-1/OpenNeuro-ReadingBrainProjectL1
 
singularity run --cleanenv --home $PWD \
--bind ${SCRATCH_DIR}:/data \
--bind ${SCRATCH_DIR}/derivatives:/out \
/arc/project/st-weberam2-1/Installations/qsiprep/qsiprep-0.15.2.sif \
--participant_label 47 \
--recon-only --recon_input ${SCRATCH_DIR}/derivatives/qsiprep --recon_spec mrtrix_singleshell_ss3t_ACT-hsvs \
--freesurfer-input ${SCRATCH_DIR}/derivatives/freesurfer \
--fs-license-file /arc/project/st-weberam2-1/license.txt \
--output-resolution 1.8 \
/data /out participant
```

### MRView

On local machine

```bash
cd ~/Desktop/PrecisionHealth/OpenNeuro/derivatives/qsirecon/sub-47/dwi
tckedit sub-47_acq-multiband_space-T1w_desc-preproc_desc-tracks_ifod2.tck -num 200000 tracks_200k_sift.tck
mrview sub-47_acq-multiband_space-T1w_desc-preproc_desc-wmFODmtnormed_ss3tcsd.mif.gz -tractography.load tracks_200k_sift.tck &
```

