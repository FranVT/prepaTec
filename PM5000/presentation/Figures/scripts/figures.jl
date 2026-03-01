"""
    Figures for critical points
"""

using GLMakie, LaTeXStrings, Typst_jll

# these are relative to 1 CSS px
inch = 96;
pt = 4/3;
cm = inch / 2.54;



# Definition of the function 
function f(x)
    return exp(cos(x))
end

# Definition o fthe derivative
function df(x)
    return -exp(cos(x))*sin(x)
end

# Domain to plot
x_min=-2*pi;
x_max=2*pi;

#Computational parameters
N=2^7;

# Create the domain
x_domain=range(x_min,x_max,length=N);

# Evaluate the function
f_eval=map(x->f(x),x_domain);
df_eval=map(x->df(x),x_domain);

# Critical points
x_critical=range(x_min,x_max,step=pi);
f_crpnts=map(x->f(x),x_critical);
df_roots=map(x->df(x),x_critical);

#=
    Graficar
=#

tl_sz=0.55cm;
ot_sz=0.5cm;

fig=Figure(size=(15cm,12cm));
ax=Axis(fig[1,1],
             xlabel=L"x",
             #ylabel=L"y",
             titlesize=tl_sz,
             xticklabelsize=ot_sz,
             yticklabelsize=ot_sz,
             xlabelsize=tl_sz,
             ylabelsize=tl_sz,
             #xminorticksvisible=true,
             #xminorgridvisible=true,
             xticks=(x_min:pi/2:x_max,[L"-2\pi",L"-3/2\pi",L"-\pi",L"-1/2\pi",L"0",L"1/2\pi",L"\pi",L"3/2\pi",L"2\pi"])
   )

vlines!(ax,x_critical,linestyle=:dash,color=:black,linewidth=0.05cm)

lines!(ax,collect(x_domain),collect(f_eval),label=L"f(x)",linewidth=0.075cm)
lines!(ax,collect(x_domain),collect(df_eval),label=L"\frac{\mathrm{d}f(x)}{\mathrm{d}(x)}",linewidth=0.075cm)

scatter!(ax,x_critical,f_crpnts,markersize=0.35cm)
scatter!(ax,x_critical,df_roots,markersize=0.35cm)

Legend(fig[1,2],ax,
      L"\mathrm{Labels}",
     labelsize=0.5cm)

#save("../fig_exampleCrPnt1.png", fig, px_per_unit = 300/inch)

