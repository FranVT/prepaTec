using GLMakie

# Create a figure with 16:9 aspect ratio (1600x900 resolution)
fig = Figure(size = (1600, 900))

# Define axis with specified limits and grid properties
ax = Axis(fig[1, 1],
          limits=(-0.1, 1.1,-0.1, 1.1),
    xgridvisible = true,
    ygridvisible = true,
    xgridcolor = :black,
    ygridcolor = :black,
    xgridwidth = 1,
    ygridwidth = 1,
    xminorgridvisible = true,
    yminorgridvisible = true,
    xminorgridcolor = (:gray, 0.5),
    yminorgridcolor = (:gray, 0.5),
    xminorgridwidth = 0.5,
    yminorgridwidth = 0.5,
    xminorticks = IntervalsBetween(4),  # 4 minor grid lines between majors
    yminorticks = IntervalsBetween(4),
    xminorticksvisible = true,
    yminorticksvisible = true,
    xticks = -0.2:0.2:1.2,
    yticks = -0.2:0.2:1.2,
    xticklabelsize = 24.0f0,
    yticklabelsize = 24.0f0
   )

# Ensure the axis fills the figure layout
colsize!(fig.layout, 1, Relative(1))
rowsize!(fig.layout, 1, Relative(1))

# Display the figure (opens an interactive window)
display(fig)

# Save the figure (captures window content)
save("grid_plot_glmakie.png", fig)

println("Figure saved as grid_plot_glmakie.png")
