import pandas as pd
import numpy as np

# # read csv files
# df1 = pd.read_csv('old/2020.csv')
# df2 = pd.read_csv('old/2021.csv')
# df3 = pd.read_csv('old/2022.csv')
df = pd.read_csv("crimes.csv")

# merge the files
# df = df1.append(df2)
# df = df.append(df3)


# pd.set_option('display.max_columns', None)
# print(df)

# # # drop unneeded columns
# # df = df.drop(columns=['Case Number', 'Beat', "District", "Ward", "FBI Code", "X Coordinate", "Y Coordinate", "Updated On", "Latitude", "Longitude"])
# # df = df.drop(columns=['Description'])
# df = df.drop(columns=['Location'])
# # print(df.info())
# # print(df.describe())

# # # drop missing values
# # # print(df.isna().sum())
# # df = df.dropna()
# # print(df.info())
# # # print(df.isna().sum())

# # # check duplicates
# # # print(len(pd.unique(df['ID']))) #627191


# # # check valid values
# print(len(pd.unique(df['Block']))) #32032
# print(len(pd.unique(df['Location Description']))) #176
# print(len(pd.unique(df['Community Area']))) #77
# # print(len(pd.unique(df['Location']))) #226995
# # print(len(pd.unique(df['Area']))) #9

# print(len(pd.unique(df['IUCR']))) #329
# print(len(pd.unique(df['Primary Type']))) #33
# print(len(pd.unique(df['Description']))) #435

# print(len(pd.unique(df['Arrest']))) #2
# print(len(pd.unique(df['Domestic']))) #2

# print(len(pd.unique(df['Year']))) #3


print(df['Primary Type'].value_counts()["THEFT"])

# # print(pd.unique(df['Primary Type']))
# # print(pd.unique(df['Area']))
# # print(pd.unique(df['Location Description']))


# # df_areas = pd.read_excel('areas.xlsx', index_col=None)
# # print(df_areas.info())

# # df['Community Area'] = df['Community Area'].apply(np.int64)
# # print(df.info())

# # df['Community Area Name'] = df['Community Area'].map(df_areas.set_index('Community Area')['Community Area Name'])
# # print(df)

# pd.set_option('display.max_columns', None)
# print(df.head())

# export to csv
# df.to_csv('crimesIN.csv', index=False)