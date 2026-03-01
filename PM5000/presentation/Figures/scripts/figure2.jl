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
    return x*100*exp(-0.05*x) - 20*100*exp(-0.05*x) - 500
end

# Definition o fthe derivative
function df(x)
    h=1e-6;
    f_2=f(x+2*h);
    f_0=3*f(x);
    f_1=4*f(x+h)
    return -(f_2 - f_1 + f_0)/(2*h) 
end

# Domain to plot
x_min=0;
x_max=250;

#Computational parameters
N=2^7;

# Create the domain
x_domain=range(x_min,x_max,length=N);

# Evaluate the function
f_eval=map(x->f(x),x_domain);
df_eval=map(x->df(x),x_domain);

# Critical points
x_critical=40;
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
             limits=(x_min,x_max,-550,50),
             #xminorticksvisible=true,
             #xminorgridvisible=true,
             xticks=x_min:40:x_max
   )

vlines!(ax,x_critical,linestyle=:dash,color=:black,linewidth=0.05cm)

lines!(ax,collect(x_domain),collect(f_eval),label=L"f(x)",linewidth=0.075cm)
lines!(ax,collect(x_domain),collect(df_eval),label=L"\frac{\mathrm{d}f(x)}{\mathrm{d}(x)}",linewidth=0.075cm)

scatter!(ax,x_critical,f_crpnts,markersize=0.35cm)
scatter!(ax,x_critical,df_roots,markersize=0.35cm)

Legend(fig[1,2],ax,
      L"\mathrm{Labels}",
     labelsize=0.5cm)

save("../fig_exampleCrPnt2.png", fig, px_per_unit = 300/inch)




