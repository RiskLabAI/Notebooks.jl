"""----------------------------------------------------------------------
    function: Generates random data
    reference: De Prado, M. (2018) Advances in financial machine learning. John Wiley & Sons.
    methodology: Snipet 16.4, Page 241
----------------------------------------------------------------------"""
function randomData(numberObservations, #number of observation
                    size0, # size uncorrelated data
                    size1, # size correlated data
                    sigma1) # sigma for uncorrelated data
    data1 = rand(Normal(0, 1), numberObservations, size0) # random normal data
    columns = rand(1:size0, size1) # select random column
    data2 = data1[:, columns] + rand(Normal(0, sigma1), numberObservations, length(columns)) # add random shock into columns
    data = hcat(data1, data2) # merge two data
    dataframe = DataFrames.DataFrame(data, :auto) # dataframe of data
    DataFrames.rename!(dataframe, Symbol.(names(dataframe)) .=> Symbol.(collect(1:size(data)[2]))) # rename dataframe
    return dataframe, columns
end