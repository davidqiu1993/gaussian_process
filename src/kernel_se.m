function [k_AB] = kernel_se(X_A, X_B, sigma_a, sigma_l)
% The square exponential kernel function.
% X_A       - A m-by-1 vector containing the sample locations
% X_B       - A n-by-1 vector containing the sample locations
% sigma_a   - The amplitude factor (default: 1.0)
% sigma_l   - The length scale (default: 1.0)

if ~exist('sigma_a', 'var')
    sigma_a = 1.0;
end
if ~exist('sigma_l', 'var')
    sigma_l = 1.0;
end

M_A = X_A * ones(1, size(X_B,1));
M_B = ones(size(X_A,1), 1) * X_B';

k_AB = (sigma_a^2) * exp(- (M_A - M_B) .* (M_A - M_B) / (sigma_l^2));

end
