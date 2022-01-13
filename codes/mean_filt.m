function out_img = mean_filt(img, window_size)
%MEAN_FILT mean_filt is mean value filter for noise reduction

% find the size of image
[M, N] = size(img(:, :, 1));

% channel spearation
img_r=uint16(img(:, :, 1));
img_g=uint16(img(:, :, 2));
img_b=uint16(img(:, :, 3));

% initialize channel
nr_img_r=img_r; 
nr_img_g=img_g;
nr_img_b=img_b;

for i = fix(window_size/2)+1 : M-fix(window_size/2)
    for j = fix(window_size/2)+1 : N-fix(window_size/2)
        
        psum_r=uint16(1);
        psum_g=uint16(1);
        psum_b=uint16(1);
        for m = 0 : window_size-1
            for n = 0 : window_size-1
                psum_r=psum_r+img_r(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                psum_g=psum_g+img_g(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
                psum_b=psum_b+img_b(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
            end
        end
        
        nr_img_r(i,j)=psum_r/(window_size*window_size);
        nr_img_g(i,j)=psum_g/(window_size*window_size);
        nr_img_b(i,j)=psum_b/(window_size*window_size);
    end
end


% reassemble channel
out_img(:, :, 1)=uint8(nr_img_r);
out_img(:, :, 2)=uint8(nr_img_g);
out_img(:, :, 3)=uint8(nr_img_b);
end

