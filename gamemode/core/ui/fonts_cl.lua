for size=10,60 do
    surface.CreateFont( "frp."..size, {
        font = "Roboto",
        extended = true,
        size = size,
        weight = 500,
        antialias = true,
        additive = true,
    } )  
end
