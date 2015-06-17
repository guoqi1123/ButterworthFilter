function n = getorder(beta)
  n = 0.5 * (log(10^(-0.1*3)-1)-log(10^(-0.1*40)-1))/(log(1./beta));
end