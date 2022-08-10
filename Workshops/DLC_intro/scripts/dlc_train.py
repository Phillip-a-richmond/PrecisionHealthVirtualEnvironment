
import deeplabcut as dlc

config_path = '/full_path_of_folder_containing_config_file/config.yaml'

dlc.train_network(config_path, saveiters = 250, maxiters = 1000, displayiters = 100)

dlc.evaluate_network(config_path)
