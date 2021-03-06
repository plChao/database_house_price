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
col = list(df.columns)
col.insert(0, 'city')
merge_df = pd.DataFrame(columns=col)
print(merge_df)


# In[3]:


city_dict = {
    'A':'臺北市', 'J':'新竹縣', 'S':'高雄縣', 
    'B':'臺中市', 'K':'苗栗縣', 'T':'屏東縣', 
    'C':'基隆市', 'L':'臺中縣', 'U':'花蓮縣', 
    'D':'臺南市', 'M':'南投縣', 'V':'臺東縣', 
    'E':'高雄市', 'N':'彰化縣', 'W':'金門縣', 
    'F':'臺北縣', 'O':'新竹市', 'X':'澎湖縣', 
    'G':'宜蘭縣', 'P':'雲林縣', 'Y':'陽明山', 
    'H':'桃園縣', 'Q':'嘉義縣', 'Z':'連江縣', 
    'I':'嘉義市', 'R':'臺南縣'}


# In[4]:


for foldername in os.listdir("../original"):
    if re.match("10*", foldername):
        i = 0
        for filename in os.listdir("../original/" + foldername):
            if re.match("[A-Z]_lvr_land_*", filename):
                i+=1
#                 print('../original/'+ foldername + '/' + filename)
                tmp_df = pd.read_csv('../original/'+ foldername + '/' + filename)
                tmp_df.drop([0], inplace=True)
#                 print(merge_df.shape, tmp_df.shape)
                tmp_df['city'] = city_dict[filename[0]]
                merge_df = merge_df.append(tmp_df, ignore_index=True)
        print(foldername, i)


# In[5]:


print(merge_df.shape)
merge_df = merge_df.loc[[len(x) >= 6 for x in merge_df['交易年月日']]]
merge_df.reset_index(drop=True, inplace=True)
merge_df = merge_df[merge_df['鄉鎮市區'].notna()]
merge_df.reset_index(drop=True, inplace=True)
print(merge_df.shape)
# merge_df['yearmonth'] = [ x[:-2] for x in new_merge_df['交易年月日']]


# In[6]:


merge_df.to_csv('merge.csv', index=False, na_rep='NULL')


# In[7]:


tmp_df = pd.DataFrame([ x[:-4] for x in merge_df['交易年月日']])
tmp_df[0].value_counts()


# In[ ]:




