
import deeplabcut as dlc

config_path = dlc.create_new_project('Project_name', 'Experimenter', ['videofile_path'], working_directory = 'path_where_you_want_the_project_files', videotype='mp4', copy_videos = True)

dlc.extract_frames(config_path, 'automatic','kmeans',crop=False)

dlc.label_frames(config_path)

dlc.cropimagesandlabels(config_path)

dlc.create_training_dataset(config_path)

dlc.train_network(config_path, saveiters = 2500, maxiters = 10000, displayiters = 100)

dlc.evaluate_network(config_path)

dlc.analyze_videos(config_path, ['file_directory_of_file_1'], save_as_cv = True)

dlc.create_labeled_video(config_path, ['final_file_directory_of_file_1'])
