module MyThemes

import Makie: Theme

# Makie theme for reports
report_theme = Theme(;
    figure_padding = 30,
    fonts = (; regular = "Computer Modern", ),
    fontsize = 24,
    Lines = (linewidth = 3,),
    Axis = (ygridvisible = true,
        xgridvisible = true,),
    Legend = (framevisible = false,)
)

export report_theme

# Makie theme for paper
paper_theme = Theme(;
    figure_padding = 30,
    # font = "Linux Libertine",
    fonts = (; regular = "Linux Libertine", ),
    fontsize = 38,
    Lines = (linewidth = 3,),
    Axis = (ygridvisible = false,
        xgridvisible = false,),
    Legend = (framevisible = false,)
)

nikita_theme = Theme(;
    figure_padding = 30,
    # font = "TeX Gyre Heros Makie",
    fontsize = 34,
    Lines = (linewidth = 3,),
    Axis = (ygridvisible = false,
        xgridvisible = false,),
    Legend = (framevisible = false,)
)


thesis_theme = Theme(;
    resolution = (1000,600),
    figure_padding = 20,
    fonts = (; regular = "Computer Modern", ),
    fontsize = 18,
    Lines = (linewidth = 2,),
    Marker = (markersize = 5,),
    Axis = (ygridvisible = false,
        xgridvisible = false,)
)


end # module MyThemes
