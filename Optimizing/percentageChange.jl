function pctChange(prices::DataFrames.DataFrame)
    returns = DataFrames.DataFrame()
    for sym in names(prices)[2:end]
        x = prices[!, Symbol(sym)]
        ret = Array{Float64}(undef, length(x))
        ret[1] = NaN
        for i ∈ 2:length(x)
            ret[i] = (x[i]/x[i-1]) - 1
        end
        returns[!, Symbol(sym)] = ret
    end
    return returns
end