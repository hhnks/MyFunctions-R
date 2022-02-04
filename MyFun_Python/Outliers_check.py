# -*- coding: utf-8 -*-
"""
Created on Fri Jan 28 12:52:18 2022

@author: hanna
"""
def outliers(x, s, e):
    
    # x  = dataframe
    # s = index of first column to take
    # e = index of last column to take
    
    p = x[:]
    
    for i in range(s, e+1):
        Q1 = np.quantile(p.iloc[:,i], q=0.25, axis=0)
        Q3 = np.quantile(p.iloc[:,i], q=0.75, axis=0)
        iqr = Q3 - Q1
        low = Q1 - iqr*1.5
        up = Q3 + iqr*1.5
        
        p.iloc[:,i] = np.logical_or(p.iloc[:,i] < low, p.iloc[:,i] > up)
        
    p['outliers_numb'] = np.sum(p.iloc[:,s:e+1], axis=1)
    x['outliers_numb'] = p['outliers_numb']
    
    tot = sum(x['outliers_numb'])
    totr = sum(x['outliers_numb'] > 0)
    perc = (tot*100)/(len(x)*(len(x.columns)))
    percr = (totr*100)/len(x)
    
    print("Total number of outliers: ", round(tot, 0))
    print("% of outliers: ", round(perc, 2))
    print("Total number of rows with outliers: ", round(totr, 0))
    print("% of rows with outliers: ", round(percr, 2))
    
    print("Rows with outliers: ")
    print(x[x['outliers_numb'] > 0])






#example
w = {'col1' : [1, 2, 3, 4, 5, 90, 6],
     'col2' : [13, 60, 13, 18, 13, 12, 0],
     'col3' : [1, 899, 5, 4, 3, 8, 6]}
w = pd.DataFrame(w)




