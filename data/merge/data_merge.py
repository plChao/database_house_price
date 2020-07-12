#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import re
import pandas as pd
import numpy as np


# In[2]:


df = pd.read_csv('../original/107_1/A_lvr_land_A.csv')
df.drop([0], inplace=True)
merge_df = pd.DataFrame(columns=df.columns)
print(merge_df)


# In[3]:


for foldername in os.listdir("../original"):
    if re.match("10*", foldername):
        for filename in os.listdir("../original/" + foldername):
            if re.match("[A-Z]_lvr_land_*", filename):
                tmp_df = pd.read_csv('../original/107_1/' + filename)
                tmp_df.drop([0], inplace=True)
#                 print(merge_df.shape, tmp_df.shape)
                merge_df = merge_df.append(tmp_df, ignore_index=True)


# In[4]:


merge_df.to_csv('merge.csv', index=False, na_rep='NULL')


# In[ ]:




