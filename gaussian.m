%%
function gau = gaussian(x, sigma) 
    gau = 1/(sigma*sqrt(pi))*exp(-(x*x)/(2*sigma*sigma)) ;
    return ;
end
