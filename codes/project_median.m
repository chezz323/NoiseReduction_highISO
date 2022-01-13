function out_img = project_median(img, noise_map, window_size)
%MEAN_FILT mean_filt is mean value filter for noise reduction

% find the size of image
[M, N] = size(img(:, :, 1));

% channel spearation
img_r=img(:, :, 1);
img_g=img(:, :, 2);
img_b=img(:, :, 3);

% initialize channel
nr_img_r=img_r; 
nr_img_g=img_g;
nr_img_b=img_b;

for i = fix(window_size/2)+1 : M-fix(window_size/2)
    for j = fix(window_size/2)+1 : N-fix(window_size/2)
        if noise_map(i,j)==1
            array_r=zeros(window_size^2);
            array_g=zeros(window_size^2);
            array_b=zeros(window_size^2);
            for m = 0 : window_size-1
                for n = 0 : window_size-1
                    array_r(m*window_size+n+1)=img_r(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                    array_g(m*window_size+n+1)=img_g(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                    array_b(m*window_size+n+1)=img_b(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                end
            end
            array_r=sort(array_r);
            array_g=sort(array_g);
            array_b=sort(array_b);
            nr_img_r(i,j)=array_r(fix(window_size/2));
            nr_img_g(i,j)=array_g(fix(window_size/2));
            nr_img_b(i,j)=array_b(fix(window_size/2));
        end
    end
end


% reassemble channel
out_img(:, :, 1)=nr_img_r;
out_img(:, :, 2)=nr_img_g;
out_img(:, :, 3)=nr_img_b;
end

