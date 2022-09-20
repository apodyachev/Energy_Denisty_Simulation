using PlotlyJS, CSV, DataFrames

df = CSV.File(

    raw"results.txt",

    delim=" ",

    header=false

) |> DataFrame



plot(df, kind="mesh3d", x=:Column1, y=:Column2, z=:Column3, opacity=0.50)