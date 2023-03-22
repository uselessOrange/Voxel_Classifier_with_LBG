function v = feature_vector_V2(y)
%
% v = feature_vector(yw)
%
% Extracts the feature vector v of the signal y passed as a parameter
% searching the first 10 cepstrum coefficients
%
% Input
%   y    1x64000 matrix with the samples of the filtered signal after
%        the pre-emphasis
% Output
%   v   10x500 matrix with the cepstrum coefficients of a vowel

[~, cols] = size(y);
v = zeros(10, 500);
n = 1;
for i = 1:128:cols-255
    yw = y(1,i:i+255) .* hamming(256)';
    c = ifft(log(abs(fft(yw))));
    v(:, n) = c(1:10)';
    n = n + 1;
end
yw = [y(1,cols-127:end), zeros(1,128)] .* hamming(256)';
c = ifft(log(abs(fft(yw))));
v(:, n) = c(1:10)';