function [noise_map] = noise_detect(img, window_size, threshold1, threshold2)
% find the size of image
[M, N] = size(img(:, :, 1));

% channel spearation
img_r=img(:, :, 1);
img_g=img(:, :, 2);
img_b=img(:, :, 3);
noise_map=zeros(M,N);

threshold_cnt=fix(window_size/2)+1;

temp_r=zeros(window_size^2);
temp_g=zeros(window_size^2);
temp_b=zeros(window_size^2);
for i = fix(window_size/2)+1 : M-fix(window_size/2)
    for j = fix(window_size/2)+1 : N-fix(window_size/2)
        isNoise_r=false;
        isNoise_g=false;
        isNoise_b=false;
        
        for m = 0 : window_size-1
            for n = 0 : window_size-1
                temp_r(m*window_size+n+1)=img_r(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                temp_g(m*window_size+n+1)=img_g(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                temp_b(m*window_size+n+1)=img_b(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
            end
        end

        
        count_r=0;
        for k = 1 : window_size^2
            if abs(img_r(i,j)-temp_r(k)) >= threshold1 && abs(img_r(i,j)-temp_r(k)) <= threshold2
               count_r = count_r+1; 
            end
        end
        if count_r >= threshold_cnt
            isNoise_r=true;
        end
        
        count_g=0;
        for k = 1 : window_size^2
            if abs(img_g(i,j)-temp_g(k)) >= threshold1 && abs(img_g(i,j)-temp_g(k)) <= threshold2
               count_g = count_g+1; 
            end
        end
        if count_g >= threshold_cnt
            isNoise_g=true;
        end
        
        count_b=0;
        for k = 1 : window_size^2
            if abs(img_b(i,j)-temp_b(k)) >= threshold1 && abs(img_b(i,j)-temp_b(k)) <= threshold2
               count_b = count_b+1; 
            end
        end
        if count_b >= threshold_cnt
            isNoise_b=true;
        end
        if isNoise_r && isNoise_g && isNoise_b
            noise_map(i,j)=1;
        end
    end
end
end

