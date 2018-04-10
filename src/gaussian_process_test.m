function gaussian_process_test()

A = [0.5, 0.5;
     2.0, 2.0;
     3.0, 1.5];

x_B = 0:0.05:4;
mu_B = zeros(1, length(x_B));
sigma_B = zeros(1, length(x_B));

for t = 1:length(x_B)
    [mu, sigma] = gaussian_process(A, x_B(t));
    mu_B(t) = mu;
    sigma_B(t) = sigma;
end

errorbar(x_B, mu_B, sqrt(sigma_B));

end
