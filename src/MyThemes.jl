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


"""
    get_theme(;kwargs)

Return `Theme` where the physical dimensions are defined by the `resolution` 
keyword argument with the unit given by the `unit` keyword argument.
If `fontstyle` is given as `:serif` (default) LaTeX fonts are used.
Possible units are `:mm`, `:cm`, `:pt`, `:inch`.
"""
function get_theme(;
  unit=:mm,
  fontstyle=:serif,
  size=(85, 60),
  fontsize=12,
  figure_padding=15,
  Lines=(linewidth=1,),
  Scatter=(markersize=6,),
  Legend=(framevisible=false,),
  Axis=(
    ygridvisible=false,
    xgridvisible=false,
  ),
  kwargs...)

  theme = Theme(;
    CairoMakie=(pt_per_unit=1,),
    GLMakie=(px_per_unit=1 / 0.75,),
    size=size .* unit_to_pt[unit],
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

struct Notes end

get_theme(::Notes; kwargs...) = get_theme(
  fontsize=11,
  fontstyle=:sans,
  size=(160, 110),
  figure_padding=20,
  Lines=(linewidth=1,),
  Scatter=(markersize=5,),
  Axis=(
    ygridvisible=true,
    xgridvisible=true,
  );
  kwargs...
)

theme_template = Dict(
  :notes => (
    fontsize=11,
    fontstyle=:sans,
    size=(160, 110),
    figure_padding=20,
    Lines=(linewidth=1,),
    Scatter=(markersize=5,),
    Axis=(
      ygridvisible=true,
      xgridvisible=true,
    ),
  )
)


get_theme(x; kwargs...) = get_theme(; (theme_template[x])..., kwargs...)


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
  size=(600, 400),
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
  size=(240, 170),
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
  size=(240, 240),
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
  size=(425, 240),
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
  size=(425, 283),
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
  size=(425, 425),
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
  size=(425, 500),
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
