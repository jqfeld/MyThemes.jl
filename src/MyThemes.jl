module MyThemes

import Makie: Theme, theme_latexfonts


# to get the right physical dimension with the correct font sizes
# the factor 2.83 pt/mm (72 pt/inch) should be used to convert a size in mm into 
# pt for use in resolution of vector graphics

const unit_to_pt = Dict(
    :mm => 2.83,
    :cm => 28.3,
    :pt => 1,
    :inch => 72,
)

function get_theme(;
    unit=:mm,
    fontstyle=:serif,
    resolution=(85, 60),
    fontsize=12,
    figure_padding=15,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(framevisible=false,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    ),
    kwargs...
)

    theme = Theme(;
        CairoMakie = (pt_per_unit = 1, ),
        GLMakie = (px_per_unit = 1/0.75,),
        resolution = resolution .* unit_to_pt[unit],
        fontsize,
        figure_padding,
        Lines,
        Scatter,
        Legend,
        Axis,
        kwargs...
    )
    if fontstyle == :serif
        merge!(theme, theme_latexfonts())
    end
    return theme
end


# Everything below is for compatibility with old scripts and should not be used
# aymore

# Makie theme for reports
report_theme = Theme(;
    figure_padding=30,
    fonts=(; regular="Computer Modern",),
    fontsize=24,
    Lines=(linewidth=3,),
    Axis=(ygridvisible=true,
        xgridvisible=true,),
    Legend=(framevisible=false,)
)


export report_theme

# Makie theme for paper
paper_theme = Theme(;
    figure_padding=30,
    # font = "Linux Libertine",
    fonts=(; regular="CMU Serif",),
    fontsize=38,
    Lines=(linewidth=3,),
    Axis=(ygridvisible=false,
        xgridvisible=false,),
    Legend=(framevisible=false,)
)

presentation_theme = Theme(;
    figure_padding=(10, 38, 10, 10),
    # font = "Linux Libertine",
    # fonts = (; regular = "Linux Libertine", ),
    #
    fontsize=34,
    Lines=(linewidth=2,),
    Axis=(ygridvisible=false,
        xgridvisible=false,),
    Legend=(framevisible=false,)
)

nikita_theme = Theme(;
    figure_padding=30,
    # font = "TeX Gyre Heros Makie",
    fontsize=34,
    Lines=(linewidth=3,),
    Axis=(ygridvisible=false,
        xgridvisible=false,),
    Legend=(framevisible=false,)
)


thesis_theme = Theme(;
    resolution=(600, 400),
    figure_padding=20,
    fonts=(; regular="CMU Serif",),
    fontsize=18,
    Lines=(linewidth=2,),
    Scatter=(markersize=3,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

DINA4_half_43 = Theme(;
    resolution=(240, 170),
    figure_padding=10,
    fonts=(; regular="CMU Serif",),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(
        framevisible=false,
        labelsize=9,
    ),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

DINA4_half_square = Theme(;
    resolution=(240, 240),
    figure_padding=10,
    fonts=(; regular="CMU Serif",),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(
        framevisible=false,
        labelsize=9,
    ),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

DINA4_full_169 = Theme(;
    resolution=(425, 240),
    figure_padding=10,
    fonts=(; regular="CMU Serif",),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(framevisible=false,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

"""
    DINA4_full_32 

Theme to use if the image should span over the whole text in a DIN A4 document (with 30 mm) padding on both sides.
"""
DINA4_full_32 = Theme(;
    resolution=(425, 283),
    figure_padding=15,
    fonts=(; regular="CMU Serif",),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(framevisible=false,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

DINA4_full_square = Theme(;
    resolution=(425, 425),
    figure_padding=15,
    fonts=(; regular="CMU Serif",),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(framevisible=false,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)

DINA4_full_page = Theme(;
    resolution=(425, 500),
    figure_padding=15,
    fonts=(; regular="CMU Serif", bold="CMU Serif"),
    fontsize=12,
    Lines=(linewidth=1,),
    Scatter=(markersize=6,),
    Legend=(framevisible=false,),
    Axis=(
        ygridvisible=false,
        xgridvisible=false,
    )
)



end # module MyThemes
