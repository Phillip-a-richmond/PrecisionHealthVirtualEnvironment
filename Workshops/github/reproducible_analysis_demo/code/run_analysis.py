import os
import pandas as pd
import numpy as np
import phate # https://github.com/KrishnaswamyLab/PHATE

# import data
data = pd.read_csv("data/tasic_training_b2.txt", sep="\t", index_col = 0, header = None)
print(data.head())
print("dims: ", data.shape)

# run PHATE
phate_op = phate.PHATE()
data_phate = phate_op.fit_transform(data.T)
print(data_phate.shape)

# write to csv
np.savetxt("results/phate.csv", data_phate, delimiter=",")
