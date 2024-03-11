using Plots

k_B = 1.38e-23
# k_B = 1

function brillouin(M, x)
    B1 = (2*M+1)/(2*M) * coth((2*M+1)/(2*M)*x)
    B2 = 1/(2*M) * coth(x/(2*M))
    return B1 - B2
end

function entropy(b, J)
    B = brillouin(J, b*J)
    S = k_B*(log(sinh(b*(J+0.5))/sinh(0.5*b)) - b*J*B)
    return S
end

function heat_capacity(bmin, bmax, db, J)

    b = bmin:db:bmax
    dSdb = zeros(length(b))
    for i in 1:(length(b)-1)
        dS = entropy(b[i+1], J) - entropy(b[i], J)
        dSdb[i] = dS/db
    end
    return -1*dSdb.*b[1:end]
end

xmin = 0
xmax = 5
dx = 0.01
x = xmin:dx:xmax
J = 1

# y_B = brillouin.(100, -10:0.1:10)
# plot(-10:0.1:10, y_B)

y = entropy.(x, J)[1:end-1]
y2 = heat_capacity(xmin, xmax, dx, J)[1:end-1]
plot(x,y, label="\$\\frac{S}{N}\$", color="blue")
plot!(x, y2, label="\$C_V\$")
hline!([k_B*log(2*J+1)], label="\$k_B \\ln(2J+1)\$", color="blue", linestyle=:dash)


# J = 0.5
# y = entropy.(x, J)[1:end-1]
# y2 = heat_capacity(xmin, xmax, dx, J)[1:end-1]
# plot!(x,y, label="\$\\frac{S}{N}\$", color="red")
# plot!(x, y2, label="\$C_V\$", color="red", linestyle=:dash)
# hline!([k_B*log(2*J+1)], label="\$k_B \\ln(2J+1)\$", color="red", linestyle=:dot)
yticks!([0])
yticks!(round.([1*k_B*log(2*J+1), 1/2*k_B*log(2*J+1), 0], digits=24))
xlabel!("\$b\$")
savefig("Images/magnetism_entropy.pdf")