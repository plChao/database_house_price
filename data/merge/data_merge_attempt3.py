#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import re
import pandas as pd
import numpy as np
from tqdm import tqdm


# In[2]:


column_dict = {
    'city':'city',
    'yearmonth':'yearmonth',
    '鄉鎮市區':'district',
'交易標的':'trade_target',
'土地區段位置建物區段門牌':'address',
'土地移轉總面積平方公尺':'land_area',
'都市土地使用分區':'area_use',
'非都市土地使用分區':'nonmetro_d',
'非都市土地使用編定':'nonmetro_u',
'交易年月日':'trade_date',
'交易筆棟數':'target_detail',
'移轉層次':'trade_floor',
'總樓層數':'total_floor',
'建物型態':'state',
'主要用途':'purpose',
'主要建材':'materials',
'建築完成年月':'building_date',
'建物移轉總面積平方公尺':'building_area',
'建物現況格局-房':'room',
'建物現況格局-廳':'hall',
'建物現況格局-衛':'health',
'建物現況格局-隔間':'compartment',
'有無管理組織':'manage',
'總價元':'price',
'單價元平方公尺':'unit_price',
'車位類別':'berth_type',
'車位移轉總面積平方公尺':'berth_area',
'車位總價元':'berth_price',
'備註':'note',
'編號':'trade_id'}
column_dict_inv = {v: k for k, v in column_dict.items()}


# In[3]:


df = pd.read_csv('../original/107_1/A_lvr_land_A.csv')
df.drop([0], inplace=True)
col = list(df.columns)
col.insert(0, 'city')
merge_df = pd.DataFrame(columns=col)
print(merge_df)


# In[4]:


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


# In[5]:


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


# In[6]:


print(merge_df.shape)
merge_df = merge_df.loc[[len(x) >= 6 for x in merge_df['交易年月日']]]
merge_df.reset_index(drop=True, inplace=True)
print(merge_df.shape)
merge_df = merge_df[merge_df['鄉鎮市區'].notna()]
merge_df.reset_index(drop=True, inplace=True)
print(merge_df.shape)
merge_df['yearmonth'] = [ x[:-2] for x in merge_df['交易年月日']]
merge_df.rename(columns=column_dict, inplace=True)
merge_df = merge_df.replace(np.nan, 'NULL', regex=True)


# In[7]:


# decompose
land_df = merge_df[['trade_target', 'area_use','compartment', 'manage']].copy()
land_df = land_df.drop_duplicates()
land_df.reset_index(drop=True, inplace=True)
land_df['num'] = range(len(land_df))
print(land_df)
land_df.to_csv('3_merge_1.csv', index=False, na_rep='NULL')
# print(land_df.shape)


# In[8]:


struct_df = merge_df[['nonmetro_d', 'nonmetro_u', 'state', 'purpose', 'materials', 'hall', 'berth_type']].copy()
struct_df.drop_duplicates(inplace=True)
struct_df.reset_index(drop=True, inplace=True)
struct_df['num'] = range(len(struct_df))
struct_df.to_csv('3_merge_2.csv', index=False, na_rep='NULL')
print(struct_df)


# In[9]:


other_df = merge_df[['city', 'district', 'total_floor', 'room', 'health']].copy()
other_df.drop_duplicates(inplace=True)
other_df.reset_index(drop=True, inplace=True)
other_df['num'] = range(len(other_df))
other_df.to_csv('3_merge_3.csv', index=False, na_rep='NULL')
print(other_df)


# In[ ]:


merge_df['num1'] = -1
merge_df['num2'] = -1
merge_df['num3'] = -1
def add_num(row):
#     ['trade_target', 'area_use','compartment', 'manage']
    tmp_df = land_df[(land_df['trade_target'] == row['trade_target']) &               (land_df['area_use'] == row['area_use']) &              (land_df['compartment'] == row['compartment']) &              (land_df['manage'] == row['manage'])]
    if(len(tmp_df)!=1):
        print("error on num1")
    row['num1'] = int(tmp_df['num'])
    
#     ['nonmetro_d', 'nonmetro_u', 'state', 'purpose', 'materials', 'hall', 'berth_type']
    tmp_df = struct_df[(struct_df['nonmetro_d'] == row['nonmetro_d']) &               (struct_df['nonmetro_u'] == row['nonmetro_u']) &              (struct_df['state'] == row['state']) &              (struct_df['purpose'] == row['purpose']) &              (struct_df['materials'] == row['materials']) &              (struct_df['hall'] == row['hall'])&                (struct_df['berth_type'] == row['berth_type'])]
    if(len(tmp_df)!=1):
        print("error on num2")
    row['num2'] = int(tmp_df['num'])
    
#     ['city', 'district', 'total_floor', 'room', 'health']
    tmp_df = other_df[(other_df['city'] == row['city']) &               (other_df['district'] == row['district']) &              (other_df['total_floor'] == row['total_floor']) &              (other_df['room'] == row['room']) &              (other_df['health'] == row['health'])]
    if(len(tmp_df)!=1):
        print("error on num3")
    row['num3'] = int(tmp_df['num'])
    return row

tqdm.pandas()
last_df = merge_df.apply(add_num, axis=1)


# In[ ]:


small_merge = last_df.drop(['trade_target', 'area_use','compartment', 'manage'                            ,'nonmetro_d', 'nonmetro_u', 'state', 'purpose', 'materials', 'hall', 'berth_type'                            ,'city', 'district', 'total_floor', 'room', 'health'], axis=1)
small_merge.to_csv('3_merge.csv', index=False, na_rep='NULL')
print(small_merge.shape)
print(small_merge.columns)


# In[ ]:


tmp_df = pd.DataFrame([ x[:-4] for x in merge_df['trade_date']])
tmp_df[0].value_counts()


# In[ ]:




