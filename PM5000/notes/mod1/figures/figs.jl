"""
    Script to create plots
"""

using GLMakie, Typst_jll

# Configuración general
set_theme!(theme_minimal())
update_theme!(fontsize = 12, fonts = (regular = "CMU Serif", bold = "CMU Serif Roman"))

inch = 96;
pt = 4/3;
cm = inch / 2.54;

# Primera función: f(x) = abs(x)/x
function plot_abs_over_x()
inch = 96;
pt = 4/3;
cm = inch / 2.54;

a = 0.5;

    fig = Figure(size = (12.5cm, 10cm), fontsize = 12pt)
    
    # Panel izquierdo: función abs(x)/x
    ax1 = Axis(fig[1, 1], 
               title = L"f(x) = \frac{|x|}{2x}",
               xlabel = L"x", 
               ylabel = L"f(x)",
               limits = (-3, 3, -1.5, 1.5),
               xticks = -3:1:3,
               yticks = -1:0.5:1,
    titlesize=24.0f0,
    subtitlesize=20.0f0,
    xticklabelsize=18.0f0,
    yticklabelsize=18.0f0,
    xlabelsize=22.0f0,
    ylabelsize=22.0f0)
    
    # Habilitar grid
    ax1.xgridvisible = true
    ax1.ygridvisible = true
    ax1.xgridcolor = (:gray, 0.2)
    ax1.ygridcolor = (:gray, 0.2)
    
    # Crear datos excluyendo x=0
    x_left = range(-3, -0.01, length=100)
    x_right = range(0.01, 3, length=100)
    
    # Graficar las dos partes de la función
    lines!(ax1, x_left, fill(-a, length(x_left)), color=:blue, linewidth=2)
    lines!(ax1, x_right, fill(a, length(x_right)), color=:blue, linewidth=2)
    
    # Añadir huecos en la discontinuidad
    scatter!(ax1, [0.0], [a], color=:white, markersize=15, 
             strokecolor=:blue, strokewidth=2, marker=:circle)
    scatter!(ax1, [0.0], [-a], color=:white, markersize=15,
             strokecolor=:blue, strokewidth=2, marker=:circle)
    
    # Etiquetas de los límites
    #text!(ax1, "lim x→0⁺ = 1", position = (1.5, 0.8), color=:red)
    #text!(ax1, "lim x→0⁻ = -1", position = (-2.5, -0.8), color=:red)
    #text!(ax1, "Discontinuidad de salto", position = (0.5, 0), color=:black)
    
    fig
end

# Segunda función: f(x) = (x-2)/(2(x-2))(x²+x)
function plot_rational_function()
inch = 96;
pt = 4/3;
cm = inch / 2.54;


    fig = Figure(size = (12.5cm, 10cm), fontsize = 12pt)
    
    # Panel derecho: función racional
    ax2 = Axis(fig[1, 1],
               title = L"f(x) = -\frac{\sin(x)}{x}",
               xlabel = L"x",
               ylabel = L"f(x)",
               limits = (-pi, pi, -2, 2),
               #xticks = -pi:pi/:pi,
               yticks = -1.5:0.5:1.5,
    titlesize=24.0f0,
    subtitlesize=20.0f0,
    xticklabelsize=18.0f0,
    yticklabelsize=18.0f0,
    xlabelsize=22.0f0,
    ylabelsize=22.0f0)
    
    # Habilitar grid
    ax2.xgridvisible = true
    ax2.ygridvisible = true
    ax2.xgridcolor = (:gray, 0.2)
    ax2.ygridcolor = (:gray, 0.2)
    
    # Función simplificada: f(x) = (x² + x)/2 para x ≠ 2
    f(x) = -sin(x) / x 
    
    # Crear datos excluyendo x=2
    x_left = range(-pi, pi, length=100)
#    x_right = range(2.01, 5, length=100)
    
    # Graficar la parábola
    lines!(ax2, x_left, f.(x_left), color=:blue, linewidth=2)
#    lines!(ax2, x_right, f.(x_right), color=:blue, linewidth=2)
    
    # Añadir hueco en la discontinuidad
    scatter!(ax2, [0.0], [-1.0], color=:white, markersize=10,
             strokecolor=:blue, strokewidth=2, marker=:circle)
    
    # Añadir punto del límite
    #scatter!(ax2, [2.0], [f(2.0)], color=:red, markersize=8, marker=:circle)
    
    # Líneas guía para el límite
    #hlines!(ax2, [f(2.0)], xmin=-1, xmax=2, color=:red, linestyle=:dash, linewidth=1)
    #vlines!(ax2, [2.0], ymin=0, ymax=f(2.0), color=:red, linestyle=:dash, linewidth=1)
    
    # Etiquetas
    #text!(ax2, L"\lim_{x \to 2} f(x) = 3", position = (3.5, 2), color=:red)
    #text!(ax2, "Hueco en (2,3)", position = (2.2, 4), color=:blue)
    #text!(ax2, L"f(2) = \frac{0}{0} (indeterminado)", 
    #      position = (3.5, 10), color=:orange)
    
    fig
end

# Crear y mostrar ambas figuras
fig1 = plot_abs_over_x()
fig2 = plot_rational_function()

# Mostrar las figuras
#display(fig1)
#display(fig2)

# Opcional: guardar las figuras como PNG
#save("abs_over_x_function.png", fig1)
#save("rational_function_discontinuity.png", fig2)

#println("¡Gráficas creadas exitosamente!")
