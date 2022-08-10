
import deeplabcut as dlc

config_path = '/arc/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Workshops/DLC_intro/projects/pretrained-AshliandJeff-2021-03-17/config.yaml'

dlc.analyze_videos(config_path, ['/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/pgupta02/DLC_intro/data/'], save_as_csv = True)

dlc.create_labeled_video(config_path, ['/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/pgupta02/DLC_intro/data/'])
