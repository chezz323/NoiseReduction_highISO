function out_img = gray_mean_filt(img, window_size)
%MEAN_FILT mean_filt is mean value filter for noise reduction

% find the size of image
[M, N] = size(img);

% channel spearation
img_r=uint16(img);

% initialize channel
nr_img_r=img_r; 

for i = fix(window_size/2)+1 : M-fix(window_size/2)
    for j = fix(window_size/2)+1 : N-fix(window_size/2)
        
        psum_r=uint16(1);
        for m = 0 : window_size-1
            for n = 0 : window_size-1
                psum_r=psum_r+img_r(i-fix(window_size/2)+m,j-fix(window_size/2)+n);
            end
        end
        
        nr_img_r(i,j)=psum_r/(window_size*window_size);
    end
end


% reassemble channel
out_img=uint8(nr_img_r);
end

