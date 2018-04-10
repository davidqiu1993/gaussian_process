function [mu_BcondA, sigma_BcondA] = gaussian_process(A, x_B)
% Gaussian process.
% A     - A m-by-2 matrix representing the training sample points
% x_B   - The new location to estimate the value

sigma_n = 0.05; % noise variance

X_A = A(:,1);
Y_A = A(:,2);
X_B = x_B;

K_AA = K(X_A, X_A);
K_AB = K(X_A, X_B);
K_BA = K_AB';
K_BB = K(X_B, X_B);

inv_Sigma_AA = (K_AA + sigma_n^2 * eye(size(K_AA,1)))^(-1);

mu_BcondA = K_BA * inv_Sigma_AA * Y_A;
sigma_BcondA = (K_BB + sigma_n^2) - K_BA * inv_Sigma_AA * K_AB;

function [K_ret] = K(X_A, X_B)
    sigma_a = 1.0; % amplitude factor
    sigma_l = 1.0; % length scale
    K_ret = kernel_se(X_A, X_B, sigma_a, sigma_l);
end

end
